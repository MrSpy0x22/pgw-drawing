# Moduł rysowania
Ten moduł rysuje różnego rodzaju elementy po stronie klienta. Celem modułu jest wystawienie API, które narysuje różnego rodzaju elementy, obsłuży je i odeśle odpowiednią informacje do serwera (w razie potrzeby).

# API
 * [GameText](#gameText),
 * [SelectMenu](#select-menu),
 * [PlayerBar](#player-bar),

## GameText
Moduł pokazuje tekst na ekranie. Pokazywanie i ukrywanie tekstu jest animowane.

`function showClientGameText(style, text, duration, r, g, b)`

| **Parametr**    | **Typ**        | **Wymagany?** |
|:----------------|:--------------:|--------------:|
| styl            | `number`       | tak           |
| text            | `string`       | tak           | 
| duration        | `number`       | tak           |
| r               | `number`       | nie           |
| g               | `number`       | nie           |
| b               | `number`       | nie           |

### Opis parametrów
 * `styl` - Styl tekstu (patrz niżej),
 * `text` - Tekst do wyświetlenia,
 * `duration` - Czas trwania tekstu (nie uwzględnai czasu animacji),
 * `r, g, b` - kKolor tekstu (w przypadku braku zostanie użyty domyślny dla wybranego stylu),

### Styl tekstu
| **Nazwa stałej** | **Id (liczba)** |
|:-----------------|----------------:|
| BIG_CENTER       | 1               |
| BIG_TOP          | 2               |
| STATUS           | 3               |
| SCORES           | 4               |
| DIALOG           | 5               |
| AREA_NAME        | 6               |
| VEH_NAME         | 7               |
| DAMAGES          | 8               |
| SHOUT            | 9               |

## Select Menu
Moduł rysuje listę elementów do wyboru.

`function showClientSelectMenu(id, title, data, columns, elementsPerPage, color, eventName, sendToElement)`

| **Parametr**    | **Typ**        | **Wymagany?** |
|:----------------|:--------------:|--------------:|
| id              | `number`       | tak           |
| title           | `string(1-64)` | tak           | 
| data            | `table`        | tak           | 
| columns         | `number(1-2)`  | tak           |
| elementsPerPage | `number`       | tak           |
| color           | `tocolor()`    | tak           |
| evetName        | `string`       | tak           |
| sendToElement   | `element`      | tak           |
| formatType      | `number`       | nie           |

### Opis parametrów
 * `id` - Identyfikator menu (zwracany w evencie),
 * `title` - Wyświetlany tytuł menu
 * `data` - Tabela z danymi
 * `columns` - Liczba widocznych kolumn (1 lub 2; kolumna 2 jest mniejsza i wyjustowana jest do lewej strony),
 * `elementsPerPage` - Określa rozmiar menu (wysokość) przez liczbę wyświetlanych elementów na raz,
 * `color` - Kolor ramki na górze menu,
 * `eventName` - Event po stronie serwera, który zostanie wywołany po wyborze elementu lub po wyjściu z menu,
 * `sendToElement` - Element, do którego event ma zostać wysłany,
 * `formatType` - Określa w jaki sposób ma być formatowana skrajnie prawa kolumna (określająca wartość),

### Opis danych
Dane to tablica rekordów poniższego formatu:

`{ name = "___", value = "___", format = ___, enabled = ___ }`

 * `name` - Nazwa elementu,
 * `value` - wartość (jeżeli inna niż `1 (NONE)` to wartośc _*musi*_ konwertować się na `number`),
 * `format` - Sprawdź [Opis formatów](#opis-formatów),
 * `enabled` - Fraga oznaczająca, czy element może zostać wybrany (+ efekty wizualne),

### Opis event-y

`function(menuId, itemSelected, selectedItemIndex, highlightedItem)`

 * `menuId` - Identyfikator widocznego menu,
 * `itemSelected` - Określa sposób wyjścia z menu (`true` jeżeli nastąpił wybór lub `false` jeżeli klient wyszedł z menu),
 * `selectedItemIndex` - Index na w tabeli `data`, która została wysłana w parametrze funkcji `showClientSelectMenu(..)`,
 * `highlightedItem` - Pozycja zaznaczenia na liście (od `1` do wartości określonej w parametrze `elementsPerPage` funkcji `showClientSelectMenu(..)`)  

### Opis formatów

 * `1 (NONE)` - Zwykły tekst,
 * `2 (MONEY)` - Format określający pieniądze,
 * `3 (PT), 4 (XPT), 5 (FPT), 6 (JPT)` - Format określający odpowiednie punkty,

## Player Bar
Pasek na dole ekranu, który zawiera sekcje z podstawowymi informacjami.

`function setClientPlayerBarVisible(visibilityFlag, forPlayer)`

| **Parametr**    | **Typ**        | **Wymagany?** |
|:----------------|:--------------:|--------------:|
| visibilityFlag  | `boolean`      | tak           |
| forPlayer       | `element`      | nie           |

### Opis parametrów
 * `visibilityFlag` - Określa, czy pasek powinien być rysowany,
 * `forPlayer` - Pozwala określić informacje którego gracza będą widoczne na pasku (domyślnie `localPlayer`),