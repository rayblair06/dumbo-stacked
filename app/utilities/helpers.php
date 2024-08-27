<?php
/**
 * Global helper functions
 */

if (!function_exists('base_path')) {
    /**
     * Return the base path of the application.
     *
     * @param string $path Additional path to append to the base path.
     * @return string The full path.
     */
    function base_path(string $path = ''): string
    {
        return rtrim(BASE_PATH, '/') . '/' . ltrim($path, '/');
    }
}

if (!function_exists('dd')) {
    /**
     * Dump the given value and terminate the script.
     *
     * @param mixed $value The value to dump.
     * @return void
     */
    function dd($value): void
    {
        dump($value);
        exit;
    }
}
