module Test where

qsort :: (Ord a) => [a] -> [a]
qsort []     = []
qsort (x:xs) = (qsort $ filter (< x) xs) ++ [x] ++ (qsort $ filter (>= x) xs)

addCassius [$cassius|
    #id
        /* comment */
        color: #ffffff
        font-size: 100%

    .class
        background-color:

    .#{classAsVariable}
        background-color: #ffffff
    |]

addJulius [$julius|
    // comment
    function f(_arg) {
        var g = _arg + #{f . g $ h};
        alert(g);
    }

    f(1.0);
    |]

addHamlet [$hamlet|
    <header>
        <h1>All Tags

    \<!-- is this valid hamlet? -->

    <article .fullpage>
        <div id="accordion">
            $forall tagGroup <- tagGroups
                ^{addTagGroup tagGroup}

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js">
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js">

    <script type="text/javascript">
        $(function() {
            $("#accordion").accordion({
                collapsible: true,
                autoHeight:  false,
                active:      false
            });
        });

    <p>
        Footer info
    |]
