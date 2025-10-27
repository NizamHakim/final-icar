#!/bin/bash

DOMAINS=(shared auth home map onboarding profile ticket location notification schedule failure)

OUTPUT_DIR="lib/src/l10n/generated"

for DOMAIN in "${DOMAINS[@]}"; do
    CAPITALIZED_DOMAIN="$(tr '[:lower:]' '[:upper:]' <<< "${DOMAIN:0:1}")${DOMAIN:1}"
    
    echo "⚡️ Generating localizations for: $DOMAIN"
    
    flutter gen-l10n \
      --arb-dir "lib/src/l10n/$DOMAIN" \
      --template-arb-file "${DOMAIN}_en.arb" \
      --output-dir "$OUTPUT_DIR" \
      --output-localization-file "${DOMAIN}_localizations.dart" \
      --output-class "${CAPITALIZED_DOMAIN}Localizations"
done

echo "✅ All localizations generation complete."