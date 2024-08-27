<?php

namespace App\Http\Controllers;

use Dumbo\Context;

class ApiController extends Controller
{
    public function __invoke(Context $context)
    {
        return $context->json('Hello world!');
    }
}
