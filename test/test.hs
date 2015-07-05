--
-- Haskell source file
--

[hamlet|
    <head>
        <title>#{title}
        <script src="/jquery.min.js">
        <script src="/jquery-ui.min.js">

    <!-- comment -->

    $# comment

    <body>
        <p>Go to 
        <a href="@{RouteR}">
        <a href="@?{(RouteR, [(q, p)])}">

        <p .something #{what}>

        <div id="accordion">
            $forall tagGroup <- tagGroups
                ^{addTagGroup tagGroup}


        <script type="text/javascript">
            $(function() {
                $("#accordion").accordion({
                    collapsible: true,
                    autoHeight:  false,
                    active:      false
                });
            });

        <p>_{FooterMsg}
    |]

[hamlet|<a href=@{RouteR} title="foo">#{what}?|]

[whamlet|
    <head>
        <h1>Foo

    ^{stuff}
|]

[ihamlet|
    <head>
        <h1>Foo

    _{i18nstuffs $ msg}
|]

[shamlet|
    <p>
        Some #{interpolations}
    |]

[xhamlet|
    <xml>
        <node>a #{a}
        <node>b #{b}
        <node>c @{CrouteR}
    |]

[xshamlet|
    <xml>
        <node>a #{a}
        <node>b #{b}
    |]

[cassius|
    body
        /* comment */
        color: #ffffff
        font-size: 100%

    .class
        background-color:

    .#{classAsVariable}
        background-color: #ffffff
    |]

[lucius|
    body {
        /* comment */
        color: #ffffff;
        font-size: 100%;
    }

    .class {
        background-color:
    }

    .#{classAsVariable} {
        background-color: #ffffff;
    }
    |]

[julius|
    // comment
    function f(_arg) {
        var g = _arg + #{f . g $ h};
        alert(g);
    }

    f(1.0);
    |]

[st|Some #{interpolated $ text}|]

[lt|Some #{lazily $ interpolated $ text}|]
