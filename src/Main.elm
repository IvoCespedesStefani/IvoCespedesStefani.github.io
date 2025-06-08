module Main exposing (..)

import Browser
import Html exposing (Html, div, span, text, br)
import Html.Attributes exposing (class)
import String


main : Program () () msg
main =
    Browser.sandbox
        { init = ()
        , update = \_ model -> model
        , view = \_ -> view
        }


lista : List Int
lista =
    [ 1, 2, 3, 4, 5 ]


view : Html msg
view =
    div [ class "container" ]
        [ div [ class "title" ]
            [ text "📘 Ejemplos de funciones de acceso a listas en Elm - Grupo Practico 2 26" ]
        , div [ class "subtitle" ]
            [ text "Integrantes: Ivo Cespedes Stefani, Daniela Teresita Recalde, Micaela Nataly Pawlizki" ]
        , line "Lista base: " (Debug.toString lista)
        , line "List.head: " (Debug.toString (List.head lista) ++ " (Primer elemento o Nothing si está vacía)")
        , line "List.tail: " (Debug.toString (List.tail lista) ++ " (Todos los elementos menos el primero)")
        , line "List.length: " (String.fromInt (List.length lista) ++ " (Cantidad de elementos)")
        , line "List.reverse: " (Debug.toString (List.reverse lista) ++ " (Lista al revés)")
        , line "List.member 3: " ((if List.member 3 lista then "Sí" else "No") ++ " (¿Está 3 en la lista?)")
        , line "List.isEmpty: " ((if List.isEmpty lista then "Sí" else "No") ++ " (¿Está vacía?)")
        , line "List.drop 2: " (Debug.toString (List.drop 2 lista) ++ " (Elimina los primeros 2)")
        , line "List.take 3: " (Debug.toString (List.take 3 lista) ++ " (Toma los primeros 3)")
        , br [] []
        , line "List.filter (>2): " (Debug.toString (List.filter (\x -> x > 2) lista) ++ " (Filtra los mayores a 2)")
        , line "List.map (*2): " (Debug.toString (List.map (\x -> x * 2) lista) ++ " (Multiplica cada uno por 2)")
        , line "List.indexedMap (i + x): " (Debug.toString (List.indexedMap (\i x -> i + x) lista) ++ " (Suma índice y valor)")
        , line "List.partition (>3): " (Debug.toString (List.partition (\x -> x > 3) lista) ++ " (Separa mayores y menores a 3)")
        , line "List.concat [[1,2],[3,4]]: " (Debug.toString (List.concat [[ 1, 2 ], [ 3, 4 ]]) ++ " (Une sublistas)")
        , line "List.concatMap duplicar: " (Debug.toString (List.concatMap (\x -> [ x, x ]) lista) ++ " (Duplica cada elemento)")
        ]


line : String -> String -> Html msg
line etiqueta valor =
    div [ class "line" ]
        [ text etiqueta
        , span [ class "result" ] [ text valor ]
        ]
