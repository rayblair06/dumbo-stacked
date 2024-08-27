<?php

use Dumbo\Dumbo;
use Latte\Engine;

/**
 * Container Definitions
 */

return [
   'Router' => function () {
       return new Dumbo();
   },
   'View' => function () {
       return new Engine();
   },
];
