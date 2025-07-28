#!/usr/bin/env bash

drush cr

# Change minimum stability in composer.json to allow dev packages.
if [ -f composer.json ]; then
  composer config minimum-stability dev
fi

#== Get the ai_agents_test and login_destination modules.
echo
echo 'Get the ai_agents_test and login_destination modules.'
time composer require drupal/ai_agents_test:^1.0@alpha drupal/login_destination:^2.0@beta

#== Install the ai_agents_test recipe.
cp -r extra_recipes/ai_agents_test recipes
echo 'Run the ai_agents_test recipe.'
time drush -n recipe ../recipes/ai_agents_test

#== Install all the tests groups.
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms___content_type_agent.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms___field_agent.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms___taxonomy_agent.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_test__1___mixed_bag.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_test__2___custom_address_field_not_installed.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_tests__3___custom_address_field_installed.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_test__4___display_format__removals.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_test__5___vocabulary_and_terms.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_tests__6___general_questions.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_tests__7___trickery.yaml
drush agetig modules/contrib/ai_agents_test/examples/drupal_cms/test_drupal_cms_test__8___media_tests.yaml
