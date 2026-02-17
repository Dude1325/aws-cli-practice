# Lessons Learned

## Configuration Management
- Created `users.cfg` for centralized configuration
- Used `source` to load variables
- Error handling if config file missing

## Error Handling
- Check if commands succeed before proceeding
- Use `exit 1` to signal error
- Provide clear error messages

## Script Patterns
- Idempotent cleanup (check before delete)
- Config file vs command-line arguments (both valid)
- Professional structure with error checking

## Bash Techniques
- `source ./file` - load variables
- `if ! command; then` - error handling
- `"${VAR}"` - proper variable expansion
- `2>/dev/null` - suppress errors
- `exit 1` - non-zero exit code

## Time Investment
Initially felt like I spent too much time on this.
But learned:
- Configuration management
- Error handling
- Professional script structure
These skills transfer to ALL future scripts!
