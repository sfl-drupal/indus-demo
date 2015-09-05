<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
// use Behat\Behat\Context\Step\Given;
use Behat\Behat\Definition\Call\Given;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }
  
  /**
   * @Given I am logged in as personas user :arg1
   * Stolen from drupal-extension/src/Drupal/DrupalExtension/Context/RawDrupalContext.php
   */
  public function iAmLoggedInAsPersonasUser($arg1) {
    // Check if logged in.
    if ($this->loggedIn()) {
      $this->logout();
    }

    if (!$arg1) {
      throw new \Exception('Tried to login without a user.');
    }

    $this->getSession()->visit($this->locatePath('/user'));
    $element = $this->getSession()->getPage();
    $element->fillField($this->getDrupalText('username_field'), $arg1);
    $element->fillField($this->getDrupalText('password_field'), 'personas');
    $submit = $element->findButton($this->getDrupalText('log_in'));
    if (empty($submit)) {
      throw new \Exception(sprintf("No submit button at %s", $this->getSession()->getCurrentUrl()));
    }

    // Log in.
    $submit->click();
    // Uncomment when the link for logout exits for all users 
    // if (!$this->loggedIn()) {
    //   throw new \Exception(sprintf("Failed to log in as user '%s'", $arg1));
    // }
  }

  /**
   * @Given /^I upload "([^"]*)" and add it to "([^"]*)"$/
   */
  public function iUploadAndAddItTo($image, $field) {
    $fid = 16; // Corresponds to already uploaded image empirenights.jpg
    return new Given("I fill in \"$field\" with \"$fid\"");
  }

}
