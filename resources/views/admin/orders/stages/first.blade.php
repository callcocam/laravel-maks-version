
    <b>Número de peças na entrada:</b> {{ $input->number_of_pieces }}<br>
    <b>Número de peças danificadas:</b> {{ $input->number_of_damaged_pieces }}<br>
    @if($input->piece_value)
        <b>Número de peças na saida:</b> {{ (int)Calcular(form_read( $input->number_of_pieces),form_read( $input->number_of_damaged_pieces), '-') }}<br>
    @endif
    @if($input->piece_value)
        <b>Valor cobrado por peça:</b> {{form_read( $input->piece_value) }}<br>
        @if($input->number_of_damaged_pieces)
            <b>Valor desconto por avaria:</b>
            {{ Calcular(form_read( $input->piece_value),form_read( $input->number_of_damaged_pieces), '*') }}<br>
            <b>Valor Total a pagar da etapa:</b>
            {{ Calcular(form_read( $input->piece_value),Calcular(form_read( $input->number_of_pieces),form_read( $input->number_of_damaged_pieces), '-'), '*') }}<br>
        @else
            <b>Valor Total a pagar da etapa:</b>
            {{ Calcular(form_read( $input->piece_value),form_read( $input->number_of_pieces), '*') }}<br>
        @endif
    @endif
    {{ $input->description }}<br>

