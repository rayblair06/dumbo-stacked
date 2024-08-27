<?php

namespace App\Http\Controllers;

use Dumbo\Context;

class IndexController extends Controller
{
    public function __invoke(Context $context)
    {
        $view = $this->view('home.latte', [
            'title' => 'Hello World',
        ]);

        return $context->html($view);
    }
}
