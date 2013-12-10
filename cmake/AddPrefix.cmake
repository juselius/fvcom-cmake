function (add_prefix var pfix filelist)
    foreach(i ${filelist})
        set (f ${f} ${pfix}/${i})
    endforeach()
    set (${var} ${f} PARENT_SCOPE)
endfunction()


