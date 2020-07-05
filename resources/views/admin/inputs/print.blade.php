<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>

    <title>{{ $tenant->name }}</title>
    
    <style>
        body {
            margin:0px;
            text-align: center;
            background-color: #ffffff;
        }
        #container{
            text-align: left;
            width: 700px;
            margin: auto;
        }
        #cabecalho{
            background-color: #d0d0ff;
            color: #333300;
            font-size:11pt;
            font-weight: bold;
            padding: 3px 3px 3px 10px;
        }

        #logo{
            visibility:hidden;
            display: none;
        }

        #corpo{
            margin: 10px 0 10px 0px;
        }

        #rodape #centro{
            padding-right: 10px;
            text-align:right;
            clear: both;
        }
        #rodape #final{
            padding: 0px;
            text-align:center;
            clear: both;
        }
        #rodape {
            padding:0px;
            text-align:left;
            clear: both;
            font-size:7pt;
        }
        #principal{
            background-color: #ffffff;
            padding: 0px;
            width: 100%;

        }
        #linha hr{
            border-top: 1px dashed #ccc;
            height: 0px;
            padding:0px;
            margin:0px;
        }
        #linha{
            padding:0px;
            margin:0px;
        }
        #detalhe{
            background-color: #ffffff;
            padding: 0;
            width: 100%;
            float:left;
        }
        #detalhe thead tr, tbody tr{
            font-size:7pt;
        }
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
                        {{ Calcular(form_read( $rows->piece_value),form_read( $rows->number_of_damaged_pieces), '*') }}</td>
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