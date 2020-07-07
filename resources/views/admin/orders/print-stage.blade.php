<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>{{ $tenant->name }}</title>
    <style type="text/css" rel="stylesheet">

        @media print
        {
            .table >.rows{
            border: 1px #000000 solid;
        }
            .header{
                background: #afbccc;
            }
            .botaotopo{
                display:none;
            }
            .botao_print{
                display:none;
            }
        }
    </style>
    <style type="text/css">

    </style>
    <!-- Styles -->
</head>
<body>
    <table width="100%" class="table">
        <tr class="header">
            <th class="titulo">Fornecedor</th>
            <th>Etapa</th>
            <th>Nª de peças</th>
            <th>V. por peça</th>
            <th>V. por etapa</th>
        </tr>
        @if($rows->input)
            @foreach ($rows->input as $item)
            <tr class="rows">
                <td class="titulo">{{ $item->provider->name }}</td>
                <td>{{ $item->stage->name }}</td>
                <td>{{ $item->number_of_pieces }}</td>
                <td>{{ form_read($item->piece_value) }}</td>
                <td>{{ Calcular(form_read($item->piece_value),$item->number_of_pieces, '*') }}</td>
            </tr>
            @endforeach
        @endif

      </table>
</body>
</html>
