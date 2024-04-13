# Heroku-API-Key-Tester

## Overview
This Bash script is designed to test multiple Heroku API keys by making requests to the Heroku Platform API. It retrieves information about Heroku apps associated with each API key and saves the results to a text file for analysis.

## Features
- **Multiple API Key Support**: Test multiple Heroku API keys at once by providing a list of keys in a text file.
- **Rate Limiting**: The script automatically limits the number of requests made to 10 per second to comply with the Heroku API rate limits.
- **Detailed Results**: Results of each API key's requests are saved to an output file, including key-specific output for analysis.

## Prerequisites
- Bash (Bourne Again Shell)
- curl (Command-Line Tool for HTTP Requests)

## Usage
1. Clone the repository or download the script file.
2. Prepare a text file containing your Heroku API keys, with each key on a separate line.
3. Run the script in the terminal, providing the API key file as an argument:
    ```bash
    ./heroku_api_tester.sh api_keys.txt
    ```
4. Sit back and let the script test each API key, respecting the rate limits and saving the results to the output file.

## Output
The results of each API key's requests are saved to the `heroku_results.txt` file in the current directory. Each API key's output is preceded by the key itself for easy identification.

## Notes
- Ensure that your API key file is properly formatted with one key per line.
- Be cautious with the usage of your API keys and comply with Heroku's API usage guidelines and rate limits.

## License
This project is licensed under the [MIT License](LICENSE).
