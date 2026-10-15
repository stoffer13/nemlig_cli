# Nemlig.com CLI - Grocery Shopping
# Credentials are read from NEMLIG_USER / NEMLIG_PASS, loaded from .env automatically.
# Create .env from .env.example: cp .env.example .env (and chmod 600 .env)
# The password is never passed on the command line, so it doesn't show up in `ps`.

set dotenv-load

cli := "uv run python nemlig_cli.py"

# Show available commands
default:
    @just --list

# Search for products on nemlig.com
search QUERY:
    {{cli}} search "{{QUERY}}"

# Show detailed product information
details PRODUCT_ID:
    {{cli}} details "{{PRODUCT_ID}}"

# Show current shopping basket
basket:
    {{cli}} basket

# Add product to basket (use product ID from search results)
add PRODUCT_ID QUANTITY="1":
    {{cli}} add "{{PRODUCT_ID}}" --quantity "{{QUANTITY}}"

# Show order history (optionally with ORDER_ID for details)
history ORDER_ID="":
    {{cli}} history {{ORDER_ID}}
