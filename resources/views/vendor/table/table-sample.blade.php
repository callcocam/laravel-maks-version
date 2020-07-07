      <table class="table table-sm table-hover">
        @if($headers)
            <thead>
            @foreach($headers as $header)
                @if($header['hidden_list'])
                    <th scope="col" >
                        {{ __($header['label']) }}
                    </th>
                @endif
            @endforeach
            </thead>
        @endif
        @if($rows)
            <tbody>
            @foreach($rows as $row)
                <tr>
                    @foreach($headers as $key => $header)
                        @if($header['hidden_list'])
                            <td   @if($header['width']) style="width: {{$header['width']}}" @endif>
                                @if($header['format'] == 'cover')
                                    <img src="{{ $row[$header['key']] }}" alt="{{$header['key']}}">
                                @elseif($header['format'] == 'actions')
                                    @include('vendor.table.actions',$row[$header['key']])
                                @elseif($header['format'] == 'html')
                                    {!! $row[$header['key']] !!}
                                @else
                                    @if(is_array($row[$header['key']]))
                                        @dd($row[$header['key']])
                                    @else
                                        {{ $row[$header['key']] }}
                                    @endif
                                @endif
                            </td>
                        @endif
                    @endforeach
                </tr>
            @endforeach
            </tbody>
        @endif
    </table>
