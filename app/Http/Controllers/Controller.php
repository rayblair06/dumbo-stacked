<?php

namespace App\Http\Controllers;

use Latte\Engine;

class Controller
{
    /**
     * @param Engine $templateEngine
     */
    public function __construct(
        public Engine $templateEngine
    ) {
        //
    }

    /**
     * Render a view template and send the response.
     *
     * Renders the view with the provided attributes, and sets the HTTP status code.
     * Uses the Latte templating engine.
     *
     * @param string $path The view file path relative to the views directory.
     * @param array $attributes Data to pass to the view template.
     * @param int $status_code HTTP status code to send with the response.
     * @return string
     */
    public function view(string $path, array $attributes = [], int $status_code = 200): string
    {
        $cacheDirectory = base_path('cache/views');

        if (!is_dir($cacheDirectory)) {
            mkdir($cacheDirectory, 0755, true);
        }

        $this
            ->templateEngine
            ->setTempDirectory($cacheDirectory);

        $templatePath = base_path("views/{$path}");

        if (!file_exists($templatePath)) {
            http_response_code(404);
            exit("View not found: {$templatePath}");
        }

        http_response_code($status_code);

        return $this
            ->templateEngine
            ->renderToString($templatePath, $attributes);
    }
}
