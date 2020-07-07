    <div class="table-wrapper">
    <div class="table-title">
        <div class="row">
            <div class="col-sm-4">
                <h2>{{ $options['title'] }}</h2>
            </div>
            <div class="col-sm-8">
                @if($options['endpoint'])
                    <a href="{{ route(sprintf("admin.%s.index", $options['endpoint'])) }}" class="btn btn-warning"><i class="fas fa-sync"></i> <span>Recaregar</span></a>
                    <a href="{{ route(sprintf("admin.%s.create", $options['endpoint'])) }}" class="btn btn-success"><i class="fas fa-plus"></i> <span>Adicionar</span></a>
                @endif
            </div>
        </div>
    </div>
    @include('vendor.table.filter', $options)

        @if($rows)
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <!-- List group-->
                        <ul class="list-group shadow">
                            @foreach($rows as $row)
                                <li class="list-group-item">
                                    <!-- Custom content-->
                                    <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                                        <div class="media-body order-2 order-lg-1">
                                            <h5 class="mt-0 font-weight-bold mb-2">{{ $row['name'] }}</h5>
                                            <p class="font-italic text-muted mb-0 small">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit fuga autem maiores necessitatibus.</p>
                                            <div class="d-flex align-items-center justify-content-between mt-1">
                                                <h6 class="font-weight-bold my-2">$120.00</h6>
                                                <ul class="list-inline small">
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star-o text-gray"></i></li>
                                                </ul>
                                            </div>
                                        </div><img src="{{ $row['cover'] }}" alt="Generic placeholder image" width="200" class="ml-lg-5 order-1 order-lg-2">
                                    </div>
                                    <!-- End -->
                                </li>
                            @endforeach
                        </ul>
                        <!-- End -->
                    </div>
                </div>
            </div>
        @endif
        @if($data)
            {!! $data->render() !!}
        @endif
</div>
