-- Note, not a valid haskell file
module Test where

-- Some valid haskell source
f :: String -> String
f = x $ d . g h `elem` foo

-- C
addCassius [$cassius|
    #id
        font-size: 100%

    .#{myclass}
        background-color: #ffffff

    |]

-- J
addJulius [$julius|
    function x(foo) {
        var x = #{x $ "foo"};
    }

    x(1.0);
    |]

-- H
addHamlet [$hamlet|
    <header>
        <h1>All Tags

    <article .fullpage>
        <div id="accordion">
            $forall tagGroup <- tagGroups
                ^{addTagGroup tagGroup}

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js">
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js">
    <script>
        $(function() {
            $("#accordion").accordion({
                collapsible: true,
                autoHeight:  false,
                active:      false
            });
        });

    <p>
        Some text

    |]
