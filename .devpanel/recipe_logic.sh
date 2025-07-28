#!/usr/bin/env bash

drush cr

# Change minimum stability in composer.json to allow dev packages.
if [ -f composer.json ]; then
  composer config minimum-stability dev
fi

#== Install the ai_agents_test recipe.
cp -r extra_recipes/ai_agents_test recipes
echo 'Run the ai_agents_test recipe.'
time drush -n recipe ../recipes/ai_agents_test
