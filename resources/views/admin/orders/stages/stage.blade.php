@foreach ($rows->input as $input)
    <div class="ul-widget-s6__items ul-widget-card__position">
        <div class="ul-widget-card__item">
            <span class="ul-widget-s7__badge ul-widget-card__dot">
                    <a data-toggle="tooltip"
                       title="{{ $input->inputStatusMessage($input,$rows) }}"
                       href="{{ route('admin.inputs.edit',[
                            'ordem_servicos_etapas_entrada'=>$input->id,
                            'ordem_servico'=>$input->order_id
                            ]) }}">
                        <p class="badge-dot-{{ $input->inputStatusClass($input) }} ul-widget6__dot ul-widget-card__dot-xl">
                            <i class="i-{{ $input->inputStatusIcon($input,$rows) }} text-white"></i>
                        </p>
                    </a>
            </span>
            <div class="ul-widget-card__info-v2">
                <span class="t-font-boldest"><h3>{{ $input->stage->name }}</h3></span>
                <span class="t-font-bold">
                        <p>
                        <b>{{ $input->inputStatusMessage($input,$rows) }}</b><br>
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
                    </p>
                </span>
                <div class="rows">
                    <div class="col">

                        @if($input->inputStatusChek($input,'published'))
                            @if($input->payment && isset($input->payment->id))
                                <a target="_blank" href="{{ route('admin.inputs.print',$input->id) }}" class=" btn btn-warning btn-sm"> <i class="fa fa-print text-white"></i> Imprimir etapa</a>
                            @else
                                <a href="{{ route('admin.inputs.edit',[
                            'ordem_servicos_etapas_entrada'=>$input->id,
                            'ordem_servico'=>$input->order_id
                            ]) }}" class=" btn btn-{{ $input->inputStatusClass($input) }} btn-sm"> <i class="i-{{ $input->inputStatusBtnIcon($input) }} text-white"></i> {{ $input->inputStatusBtnText($input) }}</a>
                            @endif
                        @else
                            <a href="{{ route('admin.inputs.edit',[
                            'ordem_servicos_etapas_entrada'=>$input->id,
                            'ordem_servico'=>$input->order_id
                            ]) }}" class=" btn btn-{{ $input->inputStatusClass($input) }} btn-sm"> <i class="i-{{ $input->inputStatusBtnIcon($input) }} text-white"></i> {{ $input->inputStatusBtnText($input) }}</a>

                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endforeach
@push("scripts")
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();

            $('.delete').click(function () {
                return confirm("Confirmar a operação!");
            })
        })
    </script>
@endpush
