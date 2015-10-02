def add_comments(review, user)
  Comment.create(
    body: "Are you kidding me, you idiot!",
    user: user,
    review: review
  )
  Comment.create(
    body: "Don't listen to that guy, you are dead on. He's the idiot",
    user: user,
    review: review
  )
  Comment.create(
    body: Faker::Hacker.say_something_smart,
    user: user,
    review: review
  )
end

user = User.create(
  email: "user@email.com",
  password: "password",
  password_confirmation: "password"
)
admin = User.create(
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password",
  role: "admin"
)

languages = Category.create(name: "Languages")
editors = Category.create(name: "Text Editors")
frameworks = Category.create(name: "Frameworks")
plugins = Category.create(name: "Plugins, Gems, Libraries, etc.")
apis = Category.create(name: "APIs")
native = Category.create(name: "Native Apps")
browsers = Category.create(name: "Browsers")
web = Category.create(name: "Web Apps")
services = Category.create(name: "Service")
misc = Category.create(name: "Miscellaneous")

Tool.create(name: "Ruby", description: "Invented by gods, ruby"\
" is defined as 'The path to enlightenment.'", category: languages, user: user)
Tool.create(name: "JavaScript", description: "a high level, dynamic,"\
" untyped, and interpreted programming language.[6] It has"\
" been standardized"\
" in the ECMAScript language specification.[7] Alongside HTML and CSS,"\
" it is one of the three essential technologies of World Wide Web content"\
" production; the majority of websites employ it and it is"\
" supported by all"\
" modern web browsers without plug-ins", category: languages, user: user)
Tool.create(name: "Python", description: "meh", category: languages, user: user)
Tool.create(name: "Java", description: "a general-purpose computer"\
" programming language that is concurrent, class-based, object-oriented,"\
"[12] and specifically designed to have as few implementation"\
" dependencies as possible.", category: languages, user: user)
Tool.create(name: "C++", description: "a general-purpose programming"\
" language. It has imperative, object-oriented and generic programming"\
" features, while also providing facilities for low-level"\
" memory manipulation.", category: languages, user: user)
Tool.create(name: "Objective C", description: "a general-purpose,"\
" object-oriented programming language that adds Smalltalk-style messaging"\
" to the C programming language. It is the main programming language"\
" used by Apple for the OS X and iOS operating systems, and their"\
" respective application programming interfaces (APIs) Cocoa"\
" and Cocoa Touch.", category: languages, user: user)
Tool.create(name: "HTML", description: "HyperText Markup Language,"\
" commonly referred to as HTML, is the standard markup language used"\
" to create web pages.[1] Web browsers can read HTML files and render"\
" them into visible or audible web pages. HTML describes the"\
" structure of a website semantically along with cues for"\
" presentation, making it a markup language, rather than a programming"\
" language.", category: languages, user: user)
Tool.create(name: "CSS", description: "Cascading Style Sheets"\
" (CSS) is a style sheet language used for describing the"\
" presentation of a document written in a markup language.[1]"\
" Although most often used to set the visual style of web pages"\
" and user interfaces written in HTML and XHTML, the language can"\
" be applied to any XML document, including plain XML, SVG and XUL,"\
" and is applicable to rendering in speech, or on other"\
" media.", category: languages, user: user)
Tool.create(name: "PHP", description: "a server-side scripting"\
" language designed for web development but also used as a"\
" general-purpose programming language.", category: languages, user: user)
Tool.create(name: "Sublime", description: "a cross-platform text"\
" and source code editor with a Python application programming"\
" interface (API). It natively supports many programming languages"\
" and markup languages, and its functionality can be extended by"\
" users with plugins, typically community-built and maintained"\
" under free-software licenses.", category: editors, user: user)
Tool.create(name: "Atom", description: "a free and open-source"\
" text and source code editor for OS X, Linux, and Windows with"\
" support for plug-ins written in Node.js, and embedded Git Control,"\
" developed by GitHub. Atom is a desktop application built on web"\
" technologies; in other words, it is not an online web"\
" application.", category: editors, user: user)
Tool.create(name: "Vim", description: " a clone of Bill Joy's"\
" vi editor for Unix. It was written by Bram Moolenaar based on"\
" source for a port of the Stevie editor to the Amiga[4] and first"\
" released publicly in 1991.", category: editors, user: user)
Tool.create(name: "TextWrangler", description: "BBEdit is a"\
" proprietary text editor made by Bare Bones Software. Originally"\
" developed for Macintosh System Software 6, it is now available"\
" for OS X.", category: editors, user: user)
Tool.create(name: "AngularJS", description: "an open-source web"\
" application framework maintained by Google and by a community of"\
" individual developers and corporations to address many of the"\
" challenges encountered in developing single-page applications.",
category: frameworks, user: user)
Tool.create(name: "Rails", description: "Ruby on Rails, or simply"\
" Rails, is a web application framework written in Ruby under MIT"\
" License. Rails is a model–view–controller (MVC) framework,"\
" providing default structures for a database, a web service,"\
" and web pages.", category: frameworks, user: user)
Tool.create(name: "Django", description: "a free and open source"\
" web application framework, written in Python, which follows the"\
" model–view–controller (MVC) architectural pattern.",
category: frameworks, user: user)
Tool.create(name: "Zend", description: "an open source,"\
" object-oriented web application framework implemented in PHP 5"\
" and licensed under the New BSD License.", category: frameworks, user: user)
Tool.create(name: "Foundation", description: "Foundation is a"\
" responsive front-end framework. Foundation provides a responsive"\
" grid and HTML and CSS UI components, templates, and code snippets,"\
" including typography, forms, buttons, navigation and other interface"\
" components, as well as optional JavaScript extensions.",
category: frameworks, user: user)
Tool.create(name: "make_it_so", description: "Make It So is a"\
" command line utility that makes it easy to create starting"\
" points for all apps ruby.", category: plugins, user: user)
Tool.create(name: "Divise", description: "Devise is a flexible"\
" authentication solution for Rails based on"\
" Warden.", category: plugins, user: user)
Tool.create(name: "Factory Girl", description: "factory_girl is a"\
" fixtures replacement with a straightforward definition syntax,"\
" support for multiple build strategies (saved instances, unsaved"\
" instances, attribute hashes, and stubbed objects) and support for"\
" multiple factories for the same class (user, admin_user,"\
" and so on) including factory inheritance.", category: plugins, user: user)
Tool.create(name: "Pry", description: "Avoid repeating yourself,"\
" use pry-rails instead of copying the initializer to every rails"\
" project. This is a small gem which causes rails console to"\
" open pry. It therefore depends on pry.", category: plugins, user: user)
Tool.create(name: "JQuery", description: "jQuery is a cross-platform"\
" JavaScript library designed to simplify the client-side"\
" scripting of HTML.[2] jQuery is the most popular JavaScript library"\
" in use today, with installation on 65% of the top 10 million"\
" highest-trafficked sites on the Web.", category: plugins, user: user)
Tool.create(name: "pg_search", description: "PgSearch builds Active"\
" Record named scopes that take advantage of PostgreSQL's full text"\
" search", category: plugins, user: user)
Tool.create(name: "simple_form", description: "Simple Form aims to"\
" be as flexible as possible while helping you with powerful components"\
" to create your forms. The basic goal of Simple Form is to not touch"\
" your way of defining the layout, letting you find the better design"\
" for your eyes. Most of the DSL was inherited from Formtastic,"\
" which we are thankful for and should make you feel right at"\
" home.", category: plugins, user: user)
Tool.create(name: "Highcharts", description: "Highstock lets you"\
" create stock or general timeline charts in pure"\
" JavaScript.", category: plugins, user: user)
Tool.create(name: "Amazon API", description: "Amazon API Gateway"\
" is a fully managed service that makes it easy for developers to"\
" create, publish, maintain, monitor, and secure APIs at"\
" any scale.", category: apis, user: user)
Tool.create(name: "Twitter API", description: "The Twitter Platform"\
" connects your website or application with the worldwide conversation"\
" happening on Twitter.", category: apis, user: user)
Tool.create(name: "Google Maps", description: "Google Maps APIs"\
" are available for Android, iOS, web browsers and via HTTP web"\
" services.")
Tool.create(name: "Facebook API", description: "The Facebook API"\
" is a platform for building applications that are available to the"\
" members of the social network of Facebook.", category: apis, user: user)
Tool.create(name: "Github API", description: "Leverage the power"\
" of GitHub in your app. Get started with one of our guides, or jump"\
" straight into the API documentation", category: apis, user: user)
Tool.create(name: "Slack", description: "Get full access to your"\
" messages and archives, upload files easily, and receive notifications"\
" whether you're at your desk or on the go.", category: native, user: user)
Tool.create(name: "Dash", description: "Dash is an API Documentation"\
" Browser and Code Snippet Manager.", category: native, user: user)
Tool.create(name: "SizeUp", description: "SizeUp allows you to quick"\
" resize and position your windows with shortcuts.", category: native, user: user)
Tool.create(name: "Flux", description: "f.lux fixes the sun: it makes"\
" the color of your computer's display adapt to the time of day, warm"\
" at night and like sunlight during the day.", category: native, user: user)
Tool.create(name: "SketchUp", description: "SketchUp is 3D modeling"\
" software that's easy to learn and incredibly fun to"\
" use. ", category: native, user: user)
Tool.create(name: "Adobe Photoshop", description: "Adobe Photoshop"\
" is a raster graphics editor developed and published by Adobe"\
" Systems for Windows and OS X.", category: native, user: user)
Tool.create(name: "Chrome", description: "Google Chrome is a"\
" browser that combines a minimal design with"\
" sophisticated technology"\
" to make the web faster, safer, and easier.", category: browsers, user: user)
Tool.create(name: "Firefox", description: "Firefox is"\
" created by a global non-profit dedicated to putting individuals"\
" in control online.", category: browsers, user: user)
Tool.create(name: "Safari", description: "The best browser for"\
" your Mac is the one that comes with your Mac.", category: browsers, user: user)
Tool.create(name: "Internet Explorer", description: "a series"\
" of graphical web browsers developed by Microsoft and included"\
" as part of the Microsoft Windows line of operating systems,"\
" starting in 1995.", category: browsers, user: user)
Tool.create(name: "Trello", description: "Infinitely flexible."\
" Incredibly easy to use. Great mobile apps. It's free. Trello"\
" keeps track of everything, from the big picture to the minute"\
" details.", category: web, user: user)
Tool.create(name: "Draw.io", description: "draw.io is free online"\
" diagram software for making flow charts, process diagrams, org"\
" charts, UML, ER and network diagrams.", category: web, user: user)
Tool.create(name: "Google Drive", description: "Get access to files"\
" anywhere through secure cloud storage and file backup for your"\
" photos, videos, files and more with Google Drive.", category: web, user: user)
Tool.create(name: "JSfiddle", description: "Test your JavaScript,"\
" CSS, HTML or CoffeeScript online with JSFiddle code"\
" editor.", category: web, user: user)
Tool.create(name: "Codeship", description: "Monitor your Codeship"\
" builds with the Shipscope Chrome extension.", category: services, user: user)
Tool.create(name: "Hound", description: "Automated review for"\
" code style. Contribute to hound development by creating an"\
" account on GitHub.", category: services, user: user)
Tool.create(name: "Hammer", description: "A hammer is a tool"\
" that delivers a blow (a sudden impact) to a computer object."\
" Most hammers are hand tools used to drive nails, fit parts,"\
" forge metal, and break apart objects. Hammers vary in shape,"\
" size, and structure, depending on their"\
" purposes.", category: misc, user: user)

Tool.all.each do |tool|
  good_review = Review.create(
  rating: 5,
    body: "It's awesome!",
    tool: tool,
    user: user
  )
  add_comments(good_review, user)
  bad_review = Review.create(
    rating: 1,
    body: "It's the worst!",
    tool: tool,
    user: user
  )
  add_comments(bad_review, user)
end
