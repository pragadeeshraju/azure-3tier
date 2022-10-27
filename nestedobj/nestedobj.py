def extract_value( object_dict, key ):
    key_list = key.split('/')
    value = None
    try:
        for key in key_list:
            if value == None:
                value = object_dict[key]
            else:
                value = value[key]
    except KeyError:
        print( 'Key not found!' )
        return
    return value

    
object_dict = {"x":{"y":{"z":"a"}}}

key = 'x/y/z'

value = extract_value( object_dict, key )

print( "The value is ", value )