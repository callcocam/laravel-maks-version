<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>{{ $tenant->name }}</title>
    <style type="text/css" rel="stylesheet">
        @media print
        {
            .botaotopo{
                display:none;
            }
            .botao_print{
                display:none;
            }
        }
    </style>
    <style type="text/css">
    .nav, footer, video, audio, object, embed { 
        display:none; 
        }
    .texto_tebela_lateral {
        font-size: 12px;
        text-align: left;
    }
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
    body,td,th {
        font-family: Arial, Helvetica, sans-serif;
        text-align: left;
    }
    .botaotopo {
        display:scroll;
        position:fixed;
        top:1%;
        right:1%;
    }
    .botao_print{
        display:scroll;
        position:fixed;
        top:8%;
        right:1%;
        cursor: pointer;
    }
    table.boletim_indicador {
        font-size: 12px;
        font-weight: bold;
        text-align: center;
        alignment-adjust:auto;
        vertical-align: middle;
        border-collapse: collapse;
        margin: 5px auto;
    }
    table.boletim_indicador .subtitulo {
        text-align: left;
    }
    table.boletim_indicador .titulo {
        text-align: center;
        background-color: #EEEEEE;
        color: #666666;
    }
    table.boletim_indicador td {
        text-align: center;
        border: solid 1px gray;
    }
    .current {
        font-size: 20px;
        text-align: justify;
        font-size: 16px;
    }
    .current1 {font-size: 20px;
        text-align: justify;
        font-size: 18px;
    }
    .boletim {
        text-align: center;
    }
    .current10 {    font-size: 20px;
        text-align: justify;
        font-size: 16px;
    }
    </style>
    <!-- Styles -->
</head>
<body>
    <table width="100%">
        <tr>
            <td class="titulo">Fornecedor</td>
            <td>Etapa</td>
            <td>Números de peças</td>
            <td>Valor por peça</td>
            <td>Valor por etapa</td>
        </tr>
        @if($rows->input)
            @foreach ($rows->input as $item)
            <tr>
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
