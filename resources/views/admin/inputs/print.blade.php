<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>{{ $tenant->name }}</title>

    <style>

    </style>
    <!-- Styles -->
</head>
<body>
    <table width="100%">
        <tbody>
        @if($rows)
            <tr>
                <td class="titulo">{{ $rows->stage->name }}</td>
            </tr>
            <tr>
                <td>{{ $rows->inputStatusMessage($rows,$rows->order) }}</td>
            </tr>
            <tr>
                <td><b>Número de peças:</b> {{ $rows->number_of_pieces }}</td>
            </tr>
            <tr>
                <td><b>Número de peças danificadas:</b> {{ $rows->number_of_damaged_pieces }}</td>
            </tr>

                @if($rows->number_of_damaged_pieces)
                <tr>
                     <td><b>Número de peças restantes:</b> {{ (int)Calcular(form_read( $rows->number_of_pieces),form_read( $rows->number_of_damaged_pieces), '-') }}</td>
                    </tr>
                     @endif
                @if($rows->piece_value)
            <tr>
                <td> <b>Valor Por Peça:</b> {{form_read( $rows->piece_value) }}</td>
            </tr>
                @endif
                @if($rows->number_of_damaged_pieces)
            <tr> <td><b>Valor Desconto:</b>
                        {{ $rows->input_varia_value($rows) }}</td>
                    </tr>
                    <tr>
                        <td> <b>Valor Total:</b>
                        {{ Calcular(form_read( $rows->piece_value),Calcular(form_read( $rows->number_of_pieces),form_read( $rows->number_of_damaged_pieces), '-'), '*') }}</td>
                    </tr>
                    @else
                <tr>
                    <td> <b>Valor Total:</b>
                        {{ Calcular(form_read( $rows->piece_value),form_read( $rows->number_of_pieces), '*') }}</td>
                    </tr>
                    @endif
                <tr>
                <td> {{ $rows->description }}</td>
            </tr>
        @endif
        </tbody>
      </table>
</body>
</html>
