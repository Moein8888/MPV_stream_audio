local mp = require 'mp'
local utils = require 'mp.utils'

function add_external_audio()
    -- VBS script to open an InputBox and get the URL
    local vbs_script = [[
        Set objShell = CreateObject("WScript.Shell")
        audioURL = InputBox("Enter audio URL:", "MPV Audio Stream", "http://")
        If audioURL <> "" Then
            WScript.StdOut.WriteLine audioURL
        End If
    ]]

    -- Write the VBS script to a temporary file
    local temp_file = os.getenv("TEMP") .. "\\mpv_audio_url.vbs"
    local file = io.open(temp_file, "w")
    if file then
        file:write(vbs_script)
        file:close()
    end

    -- Execute the VBS script and read the output
    local process = utils.subprocess({args = {"wscript", temp_file}, cancellable = false})
    local audio_url = process.stdout and process.stdout:gsub("\n", ""):gsub("\r", "")

    -- Check the entered URL and stream the audio
    if audio_url and audio_url ~= "" and audio_url ~= "http://" then
        mp.commandv("audio-add", audio_url, "select")
        mp.osd_message("Streaming external audio: " .. audio_url)
    else
        mp.osd_message("No valid URL entered.")
    end

    -- Delete the temporary file
    os.remove(temp_file)
end

-- Bind the function to the key "y"

mp.add_key_binding("y", "add_external_audio", add_external_audio)
