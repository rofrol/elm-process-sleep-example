module Main exposing (..)

import Html
import Task
import Process
import Time


cmd : Cmd Msg
cmd =
    Process.sleep (2 * Time.second)
        |> Task.perform (\_ -> DismissAlert)


main : Program Never Model Msg
main =
    Html.program
        { init = ( Model True, cmd )
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }


type Msg
    = DismissAlert


type alias Model =
    { show : Bool
    }


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        DismissAlert ->
            ( { model | show = False }, Cmd.none )


view : Model -> Html.Html msg
view model =
    Html.text <| toString model.show
