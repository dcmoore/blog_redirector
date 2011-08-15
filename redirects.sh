#!/bin/sh

# $1 = path to direct to
print_redirect_script()
{
	echo "<html><head><meta http-equiv=\"Refresh\" content=\"0;url=$1\" /></head><body><p>This post has moved. Now directing you to the new site. If you were not redirected automatically, please click <a href =\"$1\">here</a></p></body></html>"
}

# $1 = old path  $2 = new path
make_new_directory_and_add_redirect()
{
	mkdir -p $1
	cd $1
	print_redirect_script $2 > index.html
	cd "../../../../../"
}


arr_of_old_paths=(	"articles/2011/6/23/type-camp-california-day-two-recap"
					"articles/2011/6/20/type-camp-california-day-one-recap"
					"articles/2011/6/11/winning-at-consistency"
					"articles/2011/6/6/humane-form-errors"
					"articles/2011/5/27/dock-manager-app-becomes-free"
					
					"articles/2011/5/24/front-end-craftsmanship-toward-a-more-meaningful-and-productive-web"
					"articles/2011/5/13/found-type-and-graphics"
					"articles/2011/5/7/fast-talking-activerecord-migrations"
					"articles/2011/5/2/a-tale-of-two-forms-part-3"
					"articles/2011/4/26/10-ways-to-do-acceptance-testing-wrong"
					
					"articles/2011/4/23/clean-this-code"
					"articles/2011/4/21/a-tale-of-two-forms-part-2"
					"articles/2011/4/14/marking-up-a-semantic-form"
					"articles/2011/4/7/inspiration-catalog-a-k-a-morgue-file"
					"articles/2011/3/31/artistic-interlude-the-near-space-endeavor"
					
					"articles/2011/3/28/clojure-mad-science"
					"articles/2011/3/25/css-craftsmanship-formatting-tips"
					"articles/2011/3/16/design-resources-for-aspiring-developers"
					"articles/2011/3/9/tangible-typography"
					"articles/2011/3/2/jenkins-rvm-and-selenium"
					
					"articles/2011/2/25/a-scenario-where-tests-help-facilitate-compatibility-and-communication"
					"articles/2011/2/2/that-s-not-in-my-string"
					"articles/2011/1/6/post-agile-standing-on-the-shoulders-of-giants"
					"articles/2010/12/21/foo"
					"articles/2010/12/9/presence-part-1"
					
					"articles/2010/12/6/clojure-libs-and-namespaces-require-use-import-and-ns"
					"articles/2010/12/3/chinese-agile-manifesto-translation"
					"articles/2010/11/26/a-leiningen-tutorial"
					"articles/2010/10/18/clean-acceptance-tests"
					"articles/2010/9/24/i-have-an-apprentice"
					
					"articles/2010/9/21/goals-for-the-growing-the-market-of-quality-development"
					"articles/2010/9/17/qualifications-of-a-craftsman"
					"articles/2010/7/10/craftsman-swap-at-relevance-day-4"
					"articles/2010/7/9/craftsman-swap-at-relevance-day-3"
					"articles/2010/7/8/craftsman-swap-at-relevance-day-2"
					
					"articles/2010/7/7/craftsman-swap-at-relevance-day-1"
					"articles/2010/7/6/javascriptness-prototype-new-class-from-classical-to-prototypal"
					"articles/2010/6/23/international-craftsman-swap-day-3"
					"articles/2010/6/22/international-craftsman-swap-day-2"
					"articles/2010/6/21/international-craftsman-swap-day-1"
					
					"articles/2010/4/21/mmemail-my-first-clojure-open-source-contribution"
					"articles/2010/4/9/tdd-in-education-they-re-doing-it-wrong"
					"articles/2010/4/6/jruby-helps-us-craft-quality-software"
					"articles/2010/3/15/makin-somthin"
					"articles/2010/3/12/the-hammock"
					
					"articles/2010/2/25/walk-and-code"
					"articles/2010/2/9/stubbing-new-considered-harmful"
					"articles/2010/1/8/zeroth-rule-of-professionalism"
					"articles/2009/12/30/a-software-craftsman-s-new-year-s-resolutions"
					"articles/2009/10/22/why-software-development-is-a-craft"
					
					"articles/2009/10/19/limelight-0-5-0-released"
					"articles/2009/10/6/pair-fridays"
					"articles/2009/10/4/reflection-on-hangman"
					"articles/2009/9/12/thoughts-from-a-boutique-software-shop"
					"articles/2009/8/28/hangman-tournament"
					
					"articles/2009/7/17/reasons-to-attend-scna"
					"articles/2009/7/12/up-and-running-with-tdd-on-android"
					"articles/2009/7/10/announcing-chiphone"
					"articles/2009/6/22/meta-programming-comes-naturally"
					"articles/2009/6/16/a-functional-refactoring-in-scala"
					
					"articles/2009/5/12/tdd-and-iphone-nstimer"
					"articles/2009/5/6/apprentice-architecture"
					"articles/2009/4/26/bug-free-or-free-bugs"
					"articles/2009/4/19/craftsman-swap-day-5"
					"articles/2009/4/17/craftsman-swap-day-4"
					
					"articles/2009/4/17/craftsman-swap-day-3"
					"articles/2009/4/16/dependency-inversion-principle-and-iphone"
					"articles/2009/4/16/craftsman-swap-day-2"
					"articles/2009/4/15/craftsman-swap-day-1"
					"articles/2009/4/8/ethical-approach-to-software-bugs"
					
					"articles/2009/3/30/material-consciousness-in-software"
					"articles/2009/3/19/software-journeyman-program"
					"articles/2009/3/13/copyrights-conundrum"
					"articles/2009/3/12/history-of-the-software-craftsmanship-manifesto"
					"articles/2009/3/8/selenium-on-rails-released-3"
					
					"articles/2009/1/10/when-is-a-mock-not-a-mock"
					"articles/2009/1/8/embedded-ruby-talky"
					"articles/2008/12/30/embedded-ruby-sings-sinatra"
					"articles/2008/12/20/embedded-ruby-first-steps"
					"articles/2008/12/3/one-take-on-configuring-rails-routes-and-asset-host"
					
					"articles/2008/1/18/peer-pressure"
					"articles/2008/1/7/lessons-of-a-craftsman-are-you-test-driving-or-just-writing-tests"
					"articles/2008/2/18/agile-production-support-squashing-release-bugs"
					"articles/2008/2/12/rinda-101"
					"articles/2008/2/7/emotional-iterations"
					
					"articles/2008/2/5/limelight-at-railsconf-2008"
					"articles/2008/4/20/bowled-over-by-rubycocoa"
					"articles/2008/4/17/rinda-and-setting-up-rindlets"
					"articles/2008/5/24/erlang-and-the-ocp"
					"articles/2008/5/18/promises-promises"
					
					"articles/2008/5/9/wake-up-and-code"
					"articles/2008/5/6/chirb-presentation"
					"articles/2008/6/27/developing-against-web-browser-navigation"
					"articles/2008/6/24/some-thoughts-on-software-defects"
					"articles/2008/6/14/active-record-migration-dependancies"
					
					"articles/2008/6/8/code-less-a-language-keystroke-expirement"
					"articles/2008/6/2/announcing-limelight"
					"articles/2008/7/26/thats-not-agile-live"
					"articles/2008/7/24/some-random-rubycocoa-stuff"
					"articles/2008/7/2/tag-im-it"
					
					"articles/2008/7/1/apprenticeship-month-one-report"
					"articles/2008/8/27/maturing-the-manifesto"
					"articles/2008/8/13/how-paul-started-coding"
					"articles/2008/8/8/how-doug-got-started-programming"
					"articles/2008/8/7/thats-not-agile-bibliography"
					
					"articles/2008/9/30/limelight-tutorial-tic-tac-toe-excample"
					"articles/2008/9/23/customer-interaction"
					"articles/2008/9/22/definition-of-software-craftsman"
					"articles/2008/9/15/own-your-tools"
					"articles/2008/9/15/selenium-on-rails-released"
					
					"articles/2008/10/29/agile-in-buenos-aires"
					"articles/2008/10/6/how-jim-got-started-programming"
					"articles/2008/10/2/fidelity-life-case-study"
					"articles/2008/10/2/software-craftsmanship-group"
					"articles/2008/11/17/observing-a-craftsman"
					
					"articles/2008/11/13/kata-langston-s-ant-in-ruby"
					"articles/2008/11/10/simon"
					"articles/2008/11/8/ruby-battleship-sparring-tournament"
					"articles/2008/11/5/limelight-0-3-0-released"
					"articles/2007/12/21/want-clean-code-stop-using-the-editor"
					
					"articles/2007/12/19/unrubify"
					"articles/2007/11/6/ruby-and-the-art-of-computer-programming"
					"articles/2007/11/4/sockets-enable-multi-lingual-applications"
					"articles/2007/10/11/test-driven-debugging"
					"articles/2007/10/8/micahs-general-guidelines-on-ruby-require"
					
					"articles/2007/9/11/a-snob"
					"articles/2007/8/21/lending-a-hand"
					"articles/2007/8/13/rubycocoa-tutorial"
					"articles/2007/8/5/thats-not-agile"
					"articles/2007/7/19/shake-things-up"
					
					"articles/2007/6/26/something-new-every-day"
					"articles/2007/6/15/test-driving-module-methods-part-two"
					"articles/2007/6/14/pair-me-up"
					"articles/2007/6/5/no-really-we-do-that"
					"articles/2007/5/21/ruby-dls-blocks"
					
					"articles/2007/5/20/lost-in-portland-and-thinking"
					"articles/2007/5/19/day-three-at-rails"
					"articles/2007/5/19/day-two-at-railsconf"
					"articles/2007/5/17/hello-from-rubyconf"
					"articles/2007/5/8/chirb-statemachine-talk"
					
					"articles/2007/5/3/test-driving-module-methods"
					"articles/2007/4/13/test-code-there-is-no-step-three"
					"articles/2007/4/7/understanding-statemachines-part-4-superstates"
					"articles/2007/2/21/sharing-a-database-among-multiple-rails-applications"
					"articles/2007/2/18/storing-binary-data-in-postgres-beware"
					
					"articles/2007/2/13/understanding-statemachines-part-3-conditional-logic"
					"articles/2007/1/29/clean-as-you-code"
					"articles/2007/1/19/three-reasons-to-use-fitnesse"
					"articles/2007/1/15/fitnesse-rails-tutorial"
					"articles/2006/11/30/understanding-statemachines-part-2-actions"
					
					"articles/2006/11/17/understanding-statemachines-part-1-states-and-transitions"
					"articles/2006/11/13/boc"
					"articles/2006/10/24/got-real"
					"articles/2006/10/13/getting-real-review"
					"articles/2006/10/3/craftsmen-are-like-babelfish"
					
					"articles/2006/9/29/rails-migrations-and-subversion"
					"articles/2006/9/26/ruby-and-human-compilers"
					"articles/2006/9/11/self-shunt"
					"articles/2006/9/8/prefactoring"
					"articles/2006/9/8/over-mocking"
					
					"articles/2006/9/8/fresh-testing"
					"articles/2006/9/7/smalltalk-bowling"
					"articles/2006/9/7/paper-bullet"
					"articles/2006/9/7/beware-the-freebie"
					"articles/2006/9/7/prelude-to-the-mock-off"
					
					"articles/2006/9/7/ilist-icomparable-icarumba"
					"articles/2006/9/7/software-apprenticeship"
					"articles/2006/9/7/jack-and-jill"
					"articles/2006/9/7/building-a-city"
					"articles/2006/9/7/buffer-to-the-rescue"
					
					"articles/2006/9/7/delegates-vs-command-pattern"
					"articles/2004/11/17/apples-and-tigers"
					)
					

arr_of_new_paths=(	"http://8thlight.github.com/billy-whited/2011/06/23/type-camp-california-day-2.html"
					"http://8thlight.github.com/billy-whited/2011/06/20/type-camp-california-day-1.html"
					"http://8thlight.github.com/colin-jones/2011/06/10/winning-at-consistency.html"
					"http://8thlight.github.com/billy-whited/2011/06/06/humane-form-errors.html"
					"http://8thlight.github.com/steven-degutis/2011/05/27/dock-app-manager-becomes-free.html"
					
					"http://8thlight.github.com/billy-whited/2011/05/24/my-proposal-for-scna-2011.html"
					"http://8thlight.github.com/billy-whited/2011/05/13/found-type-and-graphics.html"
					"http://8thlight.github.com/craig-demyanovich/2011/05/06/fast-talking-active-record-migrations.html"
					"http://8thlight.github.com/billy-whited/2011/05/02/a-tale-of-two-forms-part-3.html"
					"http://8thlight.github.com/doug-bradbury/2011/04/26/ten-ways-to-do-acceptance-testing-wrong.html"
					
					"http://8thlight.github.com/eric-smith/2011/04/23/clean-this-code.html"
					"http://8thlight.github.com/billy-whited/2011/04/21/a-tale-of-two-forms-part-2.html"
					"http://8thlight.github.com/billy-whited/2011/04/14/a-tale-of-two-forms-part-1.html"
					"http://8thlight.github.com/billy-whited/2011/04/07/inspiration-catalogs.html"
					"http://8thlight.github.com/billy-whited/2011/03/30/the-near-space-endeavor.html"
					
					"http://8thlight.github.com/colin-jones/2011/03/27/clojure-mad-science-an-evil-threading-macro-experiment.html"
					"http://8thlight.github.com/billy-whited/2011/03/24/css-formatting-tips.html"
					"http://8thlight.github.com/billy-whited/2011/03/16/design-resources-for-aspiring-developers.html"
					"http://8thlight.github.com/billy-whited/2011/03/09/tangible-typography.html"
					"http://8thlight.github.com/lihsuan-lung/2011/03/02/jenkins-rvm-and-selenium.html"
					
					"http://8thlight.github.com/steve-kim/2011/02/25/a-scenario-where-tests-help-facilitate-compatibility-and-communication.html"
					"http://8thlight.github.com/colin-jones/2011/02/02/thats-not-in-my-string.html"
					"http://8thlight.github.com/paul-pagel/2011/01/06/post-agile-standing-on-the-shoulders-of-giants.html"
					"http://8thlight.github.com/craig-demyanovich/2010/12/20/speech-is-silver-silence-is-golden.html"
					"http://8thlight.github.com/doug-bradbury/2010/12/09/presence-part-1.html"
					
					"http://8thlight.github.com/colin-jones/2010/12/05/clojure-libs-and-namespaces-require-use-import-and-ns.html"
					"http://8thlight.github.com/lihsuan-lung/2010/12/02/agile-manifesto-chinese-translation.html"
					"http://8thlight.github.com/colin-jones/2010/11/26/a-leiningen-tutorial.html"
					"http://8thlight.github.com/lihsuan-lung/2010/10/18/clean-acceptance-tests.html"
					"http://8thlight.github.com/eric-smith/2010/09/24/i-have-an-apprentice.html"
					
					"http://8thlight.github.com/paul-pagel/2010/09/21/goals-for-the-growing-the-market-of-quality-development.html"
					"http://8thlight.github.com/eric-smith/2010/09/16/qualifications-of-a-craftsman.html"
					"http://8thlight.github.com/colin-jones/2010/07/09/relevance-craftsman-swap-day-4.html"
					"http://8thlight.github.com/colin-jones/2010/07/08/relevance-craftsman-swap-day-3.html"
					"http://8thlight.github.com/colin-jones/2010/07/07/relevance-craftsman-swap-day-2.html"
					
					"http://8thlight.github.com/colin-jones/2010/07/07/relevance-craftsman-swap-day-1.html"
					"http://8thlight.github.com/justin-martin/2010/07/06/javascriptness-prototype-new-class-from-classical-to-prototypal.html"
					"http://8thlight.github.com/eric-smith/2010/06/23/international-craftsman-swap-day-3.html"
					"http://8thlight.github.com/eric-smith/2010/06/22/international-craftsman-swap-day-2.html"
					"http://8thlight.github.com/eric-smith/2010/06/21/international-craftsman-swap-day-1.html"
					
					"http://8thlight.github.com/micah-martin/2010/04/21/mmemail-my-first-clojure-open-source-contribution.html"
					"http://8thlight.github.com/eric-smith/2010/04/09/tdd-in-education-they%27re-doing-it-wrong.html"
					"http://8thlight.github.com/doug-bradbury/2010/04/06/jruby-helps-us-craft-quality-software.html"
					"http://8thlight.github.com/doug-bradbury/2010/03/15/makin-somethin.html"
					"http://8thlight.github.com/doug-bradbury/2010/03/12/the-hammock.html"
					
					"http://8thlight.github.com/doug-bradbury/2010/02/25/walk-and-code.html"
					"http://8thlight.github.com/eric-smith/2010/02/08/stubbing-new-considered-harmful.html"
					"http://8thlight.github.com/paul-pagel/2010/01/08/zeroth-rule-of-professionalism.html"
					"http://8thlight.github.com/colin-jones/2009/12/30/a-software-craftsmans-new-years-resolutions.html"
					"http://8thlight.github.com/doug-bradbury/2009/08/22/why-software-development-is-a-craft.html"
					
					"http://8thlight.github.com/micah-martin/2009/10/19/limelight-050-released.html"
					"http://8thlight.github.com/paul-pagel/2009/10/06/pair-fridays.html"
					"http://8thlight.github.com/micah-martin/2009/10/04/reflection-on-hangman.html"
					"http://8thlight.github.com/paul-pagel/2009/09/12/thoughts-from-a-boutique-software-shop.html"
					"http://8thlight.github.com/micah-martin/2009/08/28/hangman-tournament.html"
					
					"http://8thlight.github.com/paul-pagel/2009/06/17/reasons-to-attend-scna.html"
					"http://8thlight.github.com/colin-jones/2009/07/11/up-and-running-with-tdd-on-android.html"
					"http://8thlight.github.com/eric-smith/2009/07/09/announcing-chiphone.html"
					"http://8thlight.github.com/doug-bradbury/2009/06/22/meta-programming-comes-naturally-to-intern.html"
					"http://8thlight.github.com/colin-jones/2009/06/16/a-functional-refactoring-in-scala.html"
					
					"http://8thlight.github.com/eric-smith/2009/05/11/tdd-and-iphone-nstimer.html"
					"http://8thlight.github.com/paul-pagel/2009/05/06/apprentice-architecture.html"
					"http://8thlight.github.com/paul-pagel/2009/04/26/bug-free-or-free-bugs.html"
					"http://8thlight.github.com/jim-suchy/2009/04/19/obtiva-craftsman-swap-day-5.html"
					"http://8thlight.github.com/jim-suchy/2009/04/17/obtiva-craftsman-swap-day-4.html"
					
					"http://8thlight.github.com/jim-suchy/2009/04/16/obtiva-craftsman-swap-day-3.html"
					"http://8thlight.github.com/eric-smith/2009/04/16/dependency-inversion-principle-and-iphone.html"
					"http://8thlight.github.com/jim-suchy/2009/04/15/obtiva-craftsman-swap-day-2.html"
					"http://8thlight.github.com/jim-suchy/2009/04/14/obtiva-craftsman-swap-day-1.html"
					"http://8thlight.github.com/paul-pagel/2009/04/08/ethical-approach-to-software-bugs.html"
					
					"http://8thlight.github.com/paul-pagel/2009/03/30/material-consciousness-in-software.html"
					"http://8thlight.github.com/paul-pagel/2009/03/19/software-journeyman-program.html"
					"http://8thlight.github.com/micah-martin/2009/03/12/copyrights-conundrum.html"
					"http://8thlight.github.com/paul-pagel/2009/03/11/history-of-the-software-craftsmanship-manifesto.html"
					"http://8thlight.github.com/eric-smith/2009/03/07/selenium-on-rails-released.html"
					
					"http://8thlight.github.com/eric-smith/2009/01/10/when-is-a-mock-not-a-mock.html"
					"http://8thlight.github.com/doug-bradbury/2009/01/09/embedded-ruby-talks-morse.html"
					"http://8thlight.github.com/doug-bradbury/2008/12/30/embedded-ruby-sings-sinatra.html"
					"http://8thlight.github.com/doug-bradbury/2008/12/19/embedded-ruby-first-steps.html"
					"http://8thlight.github.com/jim-suchy/2008/12/02/one-take-on-configuring-rails-routes-and-asset-host.html"
					
					"http://8thlight.github.com/paul-pagel/2008/01/18/peer-pressure.html"
					"http://8thlight.github.com/eric-smith/2008/01/07/lessons-of-a-craftsman-are-you-test-driving-or-just-writing-tests%3F.html"
					"http://8thlight.github.com/paul-pagel/2008/02/18/agile-production-support-final-brush-strokes.html"
					"http://8thlight.github.com/jim-suchy/2008/02/11/rinda-101.html"
					"http://8thlight.github.com/paul-pagel/2008/02/07/emotional-iterations.html"
					
					"http://8thlight.github.com/micah-martin/2008/02/04/limelight-at-rails-conf.html"
					"http://8thlight.github.com/eric-smith/2008/04/20/bowled-over-by-rubycocoa.html"
					"http://8thlight.github.com/paul-pagel/2008/04/16/rinda-and-setting-up-rindlets.html"
					"http://8thlight.github.com/eric-smith/2008/05/24/erlang-and-the-ocp.html"
					"http://8thlight.github.com/eric-smith/2008/05/17/promises-promises.html"
					
					"http://8thlight.github.com/paul-pagel/2008/05/08/wake-up-and-code.html"
					"http://8thlight.github.com/eric-smith/2008/05/06/chirb-presentation.html"
					"http://8thlight.github.com/paul-pagel/2008/06/27/developing-against-web-browser-navigation.html"
					"http://8thlight.github.com/paul-pagel/2008/06/24/some-thoughts-on-software-defects.html"
					"http://8thlight.github.com/paul-pagel/2008/06/13/active-record-migration-dependencies.html"
					
					"http://8thlight.github.com/paul-pagel/2008/06/08/code-less-a-language-keystroke-expirement.html"
					"http://8thlight.github.com/paul-pagel/2008/06/08/code-less-a-language-keystroke-expirement.html"
					"http://8thlight.github.com/doug-bradbury/2008/07/26/embedded-ruby-sings-sinatra.html"
					"http://8thlight.github.com/eric-smith/2008/07/23/some-random-rubycocoa-stuff.html"
					"http://8thlight.github.com/micah-martin/2008/07/02/tag-im-it.html"
					
					"http://8thlight.github.com/paul-pagel/2008/06/30/apprenticeship-month-one-report.html"
					"http://8thlight.github.com/doug-bradbury/2008/08/27/maturing-the-manifesto.html"
					"http://8thlight.github.com/paul-pagel/2008/08/13/how-paul-started-coding.html"
					"http://8thlight.github.com/doug-bradbury/2008/08/08/how-doug-got-started-programming.html"
					"http://8thlight.github.com/doug-bradbury/2008/08/07/thats-not-agile-bibliography.html"
					
					"http://8thlight.github.com/paul-pagel/2008/09/29/limelight-tutorial-tic-tac-toe-example.html"
					"http://8thlight.github.com/eric-meyer/2008/09/23/customer-interaction.html"
					"http://8thlight.github.com/micah-martin/2008/09/21/definition-of-software-craftsman.html"
					"http://8thlight.github.com/doug-bradbury/2008/09/15/own-your-tools.html"
					"http://8thlight.github.com/eric-smith/2008/09/14/selenium-on-rails-released.html"
					
					"http://8thlight.github.com/micah-martin/2008/10/29/agile-in-buenos-aires.html"
					"http://8thlight.github.com/jim-suchy/2008/10/06/how-jim-got-started-programming.html"
					"http://8thlight.github.com/micah-martin/2008/10/02/fidelity-life-case-study.html"
					"http://8thlight.github.com/micah-martin/2008/10/02/software-craftsmanship-group.html"
					"http://8thlight.github.com/paul-pagel/2008/11/17/observing-a-craftsman.html"
					
					"http://8thlight.github.com/micah-martin/2008/11/13/kata-langston%27s-ant-in-ruby.html"
					"http://8thlight.github.com/micah-martin/2008/11/10/simon.html"
					"http://8thlight.github.com/micah-martin/2008/11/08/ruby-battleship-sparring-tournament.html"
					"http://8thlight.github.com/micah-martin/2008/11/05/limelight-030-released.html"
					"http://8thlight.github.com/eric-smith/2007/12/21/want-clean-code%3F-stop-using-the-editor.html"
					
					"http://8thlight.github.com/paul-pagel/2007/12/19/unrubify.html"
					"http://8thlight.github.com/paul-pagel/2007/11/06/ruby-and-the-art-of-computer-programming.html"
					"http://8thlight.github.com/doug-bradbury/2007/11/04/sockets-enable-multi-lingual-applications.html"
					"http://8thlight.github.com/eric-smith/2007/10/11/test-driven-debugging.html"
					"http://8thlight.github.com/micah-martin/2007/10/08/micah%27s-general-guidelines-on-ruby-require.html"
					
					"http://8thlight.github.com/eric-smith/2007/09/11/a-snob.html"
					"http://8thlight.github.com/jim-suchy/2007/08/21/lending-a-hand.html"
					"http://8thlight.github.com/eric-smith/2007/08/13/rubycocoa-tutorial.html"
					"http://8thlight.github.com/doug-bradbury/2007/08/05/thats-not-agile.html"
					"http://8thlight.github.com/doug-bradbury/2007/07/19/shake-things-up.html"
					
					"http://8thlight.github.com/eric-smith/2007/06/26/something-new-every-day.html"
					"http://8thlight.github.com/eric-smith/2007/06/15/test-driving-module-methods-part-two.html"
					"http://8thlight.github.com/paul-pagel/2007/06/14/pair-me-up.html"
					"http://8thlight.github.com/eric-smith/2007/06/05/no-really-we-do-that.html"
					"http://8thlight.github.com/micah-martin/2007/05/20/ruby-dsl-blocks.html"
					
					"http://8thlight.github.com/eric-smith/2007/05/20/lost-in-portland-and-thinking.html"
					"http://8thlight.github.com/eric-smith/2007/05/19/day-three-at-rails.html"
					"http://8thlight.github.com/eric-smith/2007/05/18/day-two-at-railsconf.html"
					"http://8thlight.github.com/eric-smith/2007/05/17/hello-from-railsconf.html"
					"http://8thlight.github.com/micah-martin/2007/05/08/chirb-statemachine-talk.html"
					
					"http://8thlight.github.com/eric-smith/2007/05/03/test-driving-module-methods.html"
					"http://8thlight.github.com/eric-smith/2007/04/13/test-code-there-is-no-step-three.html"
					"http://8thlight.github.com/micah-martin/2007/04/07/understanding-statemachines-part-4-superstates.html"
					"http://8thlight.github.com/jim-suchy/2007/02/20/sharing-a-database-among-multiple-rails-applications.html"
					"http://8thlight.github.com/micah-martin/2007/02/18/storing-binary-data-in-postgres-beware.html"
					
					"http://8thlight.github.com/micah-martin/2007/02/12/understanding-state-machines-part-3.html"
					"http://8thlight.github.com/micah-martin/2007/01/29/clean-as-you-code.html"
					"http://8thlight.github.com/micah-martin/2007/01/19/three-reasons-to-use-fitnesse.html"
					"http://8thlight.github.com/paul-pagel/2007/01/15/getting-started-with-rails-and-fitnesse.html"
					"http://8thlight.github.com/micah-martin/2006/11/29/understanding-statemachines-part-2-actions.html"
					
					"http://8thlight.github.com/micah-martin/2006/11/17/understanding-statemachines-part-1-states-and-transitions.html"
					"http://8thlight.github.com/micah-martin/2006/11/12/boc.html"
					"http://8thlight.github.com/micah-martin/2006/10/23/got-real.html"
					"http://8thlight.github.com/micah-martin/2006/10/13/getting-real-review.html"
					"http://8thlight.github.com/micah-martin/2006/10/02/craftsmen-are-like-babelfish.html"
					
					"http://8thlight.github.com/paul-pagel/2006/09/28/rails-migrations-and-subversion.html"
					"http://8thlight.github.com/paul-pagel/2006/09/26/ruby-and-human-compilers.html"
					"http://8thlight.github.com/paul-pagel/2006/09/11/self-shunt.html"
					"http://8thlight.github.com/paul-pagel/2006/09/07/prefactoring.html"
					"http://8thlight.github.com/paul-pagel/2006/09/07/over-mocking.html"
					
					"http://8thlight.github.com/paul-pagel/2006/09/07/fresh-testing.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/smalltalk-bowling.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/paper-bullet.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/beware-the-freebie.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/prelude-to-the-mock-off.html"
					
					"http://8thlight.github.com/micah-martin/2006/09/07/ilist-icomparable-icarumba.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/software-apprenticeship.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/jack-and-jill.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/building-a-city.html"
					"http://8thlight.github.com/micah-martin/2006/09/07/buffer-to-the-rescue.html"
					
					"http://8thlight.github.com/micah-martin/2006/09/07/delegates-vs-command-pattern.html"
					"http://8thlight.github.com/micah-martin/2004/11/17/apples-and-tigers.html"
					)
					
i=0
for arr_of_old_paths in ${arr_of_old_paths[@]}
do
	make_new_directory_and_add_redirect $arr_of_old_paths ${arr_of_new_paths[$i]}
	i=`expr $i + 1`
done