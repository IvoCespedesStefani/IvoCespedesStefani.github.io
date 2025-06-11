module Main exposing (..)

import Browser
import Html exposing (Html, div, span, text, br)
import Html.Attributes exposing (class)
import String


-- ENTRADA AL PROGRAMA

main : Program () () msg
main =
    Browser.sandbox
        { init = ()
        , update = \_ model -> model
        , view = \_ -> view
        }


-- LISTA BASE

lista : List Int
lista =
    [ 1, 2, 3, 4, 5 ]


-- VISTA PRINCIPAL

view : Html msg
view =
    div [ class "container" ]
        ([ titulo
         , integrantes
         ]
            ++ seccionesBasicas
            ++ [ br [] [] ]
            ++ seccionesAvanzadas
        )


-- TÍTULO DEL TRABAJO

titulo : Html msg
titulo =
    div [ class "title" ]
        [ text "📘 Ejemplos de funciones de acceso a listas en Elm - Grupo Práctico 2 26" ]


-- NOMBRES DE INTEGRANTES

integrantes : Html msg
integrantes =
    div [ class "subtitle" ]
        [ text "Integrantes: Ivo Cespedes Stefani, Daniela Teresita Recalde, Micaela Nataly Pawlizki, Candela Reck" ]


-- SECCIONES BÁSICAS

seccionesBasicas : List (Html msg)
seccionesBasicas =
    [ seccion "📋 Lista base" (Debug.toString lista)
    , seccion "🔹 List.head" (Debug.toString (List.head lista) ++ " — Primer elemento o Nothing si está vacía")
    , seccion "🔹 List.tail" (Debug.toString (List.tail lista) ++ " — Todos los elementos menos el primero")
    , seccion "🔹 List.length" (String.fromInt (List.length lista) ++ " — Cantidad de elementos")
    , seccion "🔹 List.reverse" (Debug.toString (List.reverse lista) ++ " — Lista al revés")
    , seccion "🔹 List.member 3" (boolStr (List.member 3 lista) ++ " — ¿Está el 3 en la lista?")
    , seccion "🔹 List.isEmpty" (boolStr (List.isEmpty lista) ++ " — ¿Está vacía?")
    , seccion "🔹 List.drop 2" (Debug.toString (List.drop 2 lista) ++ " — Elimina los primeros 2")
    , seccion "🔹 List.take 3" (Debug.toString (List.take 3 lista) ++ " — Toma los primeros 3")
    ]


-- SECCIONES AVANZADAS

seccionesAvanzadas : List (Html msg)
seccionesAvanzadas =
    [ seccion "🧪 List.filter (>2)" (Debug.toString (List.filter (\x -> x > 2) lista) ++ " — Filtra mayores a 2")
    , seccion "🧪 List.map (*2)" (Debug.toString (List.map (\x -> x * 2) lista) ++ " — Multiplica cada uno por 2")
    , seccion "🧪 List.indexedMap (i + x)" (Debug.toString (List.indexedMap (\i x -> i + x) lista) ++ " — Suma índice y valor")
    , seccion "🧪 List.partition (>3)" (Debug.toString (List.partition (\x -> x > 3) lista) ++ " — Separa mayores y menores a 3")
    , seccion "🧪 List.concat [[1,2],[3,4]]" (Debug.toString (List.concat [[ 1, 2 ], [ 3, 4 ]]) ++ " — Une sublistas")
    , seccion "🧪 List.concatMap duplicar" (Debug.toString (List.concatMap (\x -> [ x, x ]) lista) ++ " — Duplica cada elemento")
    ]


-- FUNCIÓN PARA MOSTRAR UNA LÍNEA DE RESULTADO

seccion : String -> String -> Html msg
seccion etiqueta valor =
    div [ class "line" ]
        [ text etiqueta
        , span [ class "result" ] [ text (" → " ++ valor) ]
        ]


-- FORMATO DE RESPUESTA BOOLEANA

boolStr : Bool -> String
boolStr b =
    if b then "Sí" else "No"
