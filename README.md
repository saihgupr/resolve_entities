# Resolve Entities

A sophisticated Bash script that resolves natural language phrases to Home Assistant entity IDs using domain-first fuzzy matching.

## Features

- **Domain Detection**: Automatically detects the appropriate Home Assistant domain (light, switch, climate, etc.) based on keywords
- **Fuzzy Matching**: Uses intelligent scoring to find the best entity matches
- **Multi-word Support**: Handles complex phrases like "living room ceiling light"
- **Notify Commands**: Special handling for notification services
- **Caching**: Caches entity data for improved performance
- **Configurable**: Easy configuration via `config.sh`

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/saihgupr/resolve_entities.git
   cd resolve_entities
   ```

2. Copy the example configuration:
   ```bash
   cp config.sh.example config.sh
   ```

3. Edit `config.sh` with your Home Assistant details:
   ```bash
   # Your Home Assistant URL
   HA_URL="http://your-home-assistant-ip:8123"
   
   # Your Home Assistant Long-Lived Access Token
   HA_TOKEN="your-long-lived-access-token"
   ```

4. Make the script executable:
   ```bash
   chmod +x resolve_entities.sh
   ```

## Usage

### Basic Usage
```bash
./resolve_entities.sh "turn on the living room light"
```

### Update Entity Cache
```bash
./resolve_entities.sh --update "turn on the living room light"
```

### Examples
```bash
# Lights
./resolve_entities.sh "turn on living room ceiling light"
# Output: turn on light.living_room_ceiling_light

# Switches
./resolve_entities.sh "turn off the coffee maker"
# Output: turn off switch.coffee_maker

# Climate
./resolve_entities.sh "set thermostat to 72 degrees"
# Output: set climate.thermostat to 72 degrees

# Notifications
./resolve_entities.sh "notify my iphone that dinner is ready"
# Output: notify.mobile_app_iphone that dinner is ready
```

## How It Works

1. **Domain Detection**: The script analyzes your command to detect the appropriate Home Assistant domain
2. **Entity Fetching**: Retrieves all entities from your Home Assistant instance
3. **Fuzzy Matching**: Uses a scoring system to find the best entity match:
   - Exact matches: 100 points
   - Starts with: 80 points
   - Word boundary: 60 points
   - Contains: 40 points
   - Domain bonus: +20 points
4. **Replacement**: Replaces natural language phrases with entity IDs

## Dependencies

- `curl`: For API requests to Home Assistant
- `jq`: For JSON parsing
- `bash`: Shell environment

## Configuration

The `config.sh` file contains:
- `HA_URL`: Your Home Assistant URL
- `HA_TOKEN`: Your long-lived access token

## Security Notes

- Never commit `config.sh` to version control (it's in `.gitignore`)
- Use long-lived access tokens, not your main password
- Consider using environment variables for sensitive data

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is open source. Please check the LICENSE file for details.
