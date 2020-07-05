
@isset($submit)
    <button class="btn btn-warning btn-rounded text-white"><i class="fa fa-save"></i></button>
@endisset
@isset($destroy)
    <btn-delete-component event="{{ sprintf("form-%s", $destroy['id']) }}">
        <form ref="form" action="{{ $destroy['name'] }}" method="POST">
            @csrf
            @method("DELETE")
        </form>
    </btn-delete-component>
@endisset
@isset($edit)
    <a class="btn btn-warning" href="{{ $edit['name'] }}"><i class="fa fa-edit"></i></a>
@endisset
@isset($show)
    <a class="btn btn-success" href="{{ $show['name'] }}"><i class="fa fa-eye"></i></a>
@endisset
@isset($reload)
    <a class="btn btn-{{ $reload['class'] }} text-white" href="{{ $reload['name'] }}"><i class="fa fa-{{ $reload['icon'] }}"></i></a>
@endisset
@isset($reload_edit)
    <a class="btn btn-primary btn-rounded text-white" href="{{ $reload_edit['name'] }}"><i class="fa fa-edit"></i></a>
@endisset
