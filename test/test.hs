-------------------------------------------------------------------------------
--
-- Note, not a valid haskell file
--
-------------------------------------------------------------------------------
module Test where

f = x $ d . g h `elem` foo

-- | Comment
addJulius [$julius|
    function x(foo) {
        var x = #{x $ "foo"}
    }
    |]

-- | All tags
getTagsR :: Handler RepHtml
getTagsR = do
    defaultLayout $ do
        setTitle $ toHtml $ Settings.titlePrefix ++ "All Tags"
        addKeywords $ map fst tagGroups

        [$hamlet|
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

            |]
    where
        addTagGroup :: TagGroup -> Widget ()
        addTagGroup tg = do
            let tag   = fst tg
            let posts = snd tg
            let len   = doShow $ length posts

            [$hamlet|
                <h3>#{proper tag} 
                    <span .post_count>- #{len}
                <div .hidden>
                    $forall post <- posts
                        ^{addPostBlock post}
                |]
