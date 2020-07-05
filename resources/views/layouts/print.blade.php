<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ $tenant->name }}</title>

    <!-- Styles -->
</head>
<body>
@yield('content')
</body>
</html>
