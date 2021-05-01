port module Worker exposing (main)

-- WIRING THINGS UP


port outgoing : String -> Cmd msg


main : Program Flags () Never
main =
    Platform.worker
        { init = \flags -> ( (), run flags )
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = \_ -> Sub.none
        }



-- ACTUAL APP


type alias Flags =
    { message : String
    }


run : Flags -> Cmd msg
run flags =
    outgoing flags.message
