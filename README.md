# MPV External Audio Stream

This Lua script allows you to stream external audio in the MPV media player by entering a URL. The script prompts the user to input an audio URL and then adds it as an audio track to the currently playing video.

## Features

- **Easy URL Input**: A simple InputBox is used to get the audio URL from the user.
- **Stream External Audio**: The script adds the provided URL as an audio stream to the current video.
- **Key Binding**: The function is bound to the key `y` for quick access.

## Installation

1. **Download the Script**: Save the `stream_audio.lua` file to your MPV scripts directory.
   - On Windows, this is typically `%APPDATA%\mpv\scripts\`.
   - On Linux, it is usually `~/.config/mpv/scripts/`.

2. **Run MPV**: Open MPV and load a video.

3. **Use the Script**: Press `y` to open the URL input dialog. Enter the audio URL and press OK. The external audio will be streamed and added to the current video.

## Usage

- Press `y` to open the URL input dialog.
- Enter the audio URL (e.g., `http://example.com/audio.mp3`).
- The audio will be streamed and added to the current video.

## Requirements

- **MPV Player**: Ensure you have MPV installed on your system.
- **Windows**: The script uses a VBS script for the input dialog, so it is currently Windows-only.

## License

This project is is free to use.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
