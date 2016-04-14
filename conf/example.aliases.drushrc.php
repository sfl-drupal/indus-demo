<?php 

/**
 * DO NOT EDIT. Copy this file to a new file named aliases.drushrc.php.
 * Example file.
 *  
 * Drush aliases definition.
 */

$aliases['staging'] = array(
  'root' => '/var/www/html/drupal',
  'uri' => 'http://example.com',
  'remote-host' => 'http://example.com',
  'remote-user' => 'webmaster',
  'path-aliases' => array(
    '%files' => 'sites/default/files',
  ),
);

