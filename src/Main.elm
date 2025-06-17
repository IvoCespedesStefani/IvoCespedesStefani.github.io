module Main exposing (..)

import Browser
import Html exposing (Html, br, div, span, text)
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


-- LISTA BASE (ELM)

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
            ++ [ br [] [] ]
            ++ seccionesLispBasicas
            ++ [ br [] [] ]
            ++ seccionesLispAvanzadas
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


-- SECCIONES BÁSICAS (ELM)

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


-- SECCIONES AVANZADAS (ELM)

seccionesAvanzadas : List (Html msg)
seccionesAvanzadas =
    [ seccion "🧪 List.filter (>2)" (Debug.toString (List.filter (\x -> x > 2) lista) ++ " — Filtra mayores a 2")
    , seccion "🧪 List.map (*2)" (Debug.toString (List.map (\x -> x * 2) lista) ++ " — Multiplica cada uno por 2")
    , seccion "🧪 List.indexedMap (i + x)" (Debug.toString (List.indexedMap (\i x -> i + x) lista) ++ " — Suma índice y valor")
    , seccion "🧪 List.partition (>3)" (Debug.toString (List.partition (\x -> x > 3) lista) ++ " — Separa mayores y menores a 3")
    , seccion "🧪 List.concat [[1,2],[3,4]]" (Debug.toString (List.concat [[ 1, 2 ], [ 3, 4 ]]) ++ " — Une sublistas")
    , seccion "🧪 List.concatMap duplicar" (Debug.toString (List.concatMap (\x -> [ x, x ]) lista) ++ " — Duplica cada elemento")
    ]


-- SECCIONES BÁSICAS (COMMON LISP)

seccionesLispBasicas : List (Html msg)
seccionesLispBasicas =
    [ seccion "📋 Lista base (LISP)" "(1 2 3 4 5)"
    , seccion "🔹 car" "1 — Primer elemento o nil si está vacía"
    , seccion "🔹 cdr" "(2 3 4 5) — Todos los elementos menos el primero"
    , seccion "🔹 length" "5 — Cantidad de elementos"
    , seccion "🔹 reverse" "(5 4 3 2 1) — Lista al revés"
    , seccion "🔹 member 3" "(3 4 5) — Sublista desde el 3 (o nil si no está)"
    , seccion "🔹 null" "nil — ¿Está vacía?"
    , seccion "🔹 nthcdr 2" "(3 4 5) — Elimina los primeros 2 elementos"
    , seccion "🔹 subseq 0 3" "(1 2 3) — Toma los primeros 3 elementos"
    ]


-- SECCIONES AVANZADAS (COMMON LISP)

seccionesLispAvanzadas : List (Html msg)
seccionesLispAvanzadas =
    [ seccion "🧪 remove-if-not (> 2)" "(3 4 5) — Filtra mayores a 2"
    , seccion "🧪 mapcar (* 2)" "(2 4 6 8 10) — Multiplica cada elemento por 2"
    , seccion "🧪 mapcar (+ índice)" "(1 3 5 7 9) — Suma índice y valor"
    , seccion "🧪 partition (> 3)" "((4 5) (1 2 3)) — Separa mayores y menores a 3"
    , seccion "🧪 append '((1 2) (3 4))" "(1 2 3 4) — Une sublistas"
    , seccion "🧪 mapcan duplicar" "(1 1 2 2 3 3 4 4 5 5) — Duplica cada elemento"
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
