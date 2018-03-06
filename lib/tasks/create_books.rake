namespace :create_books do
  desc 'create books when project new'
  task create_new_books: :environment do
    Book.create(name: 'Clean Code', author: 'Robert C. Martin', description: 'Even bad code can function.
      But if code isn’t clean, it can bring a development organization to its knees.
      Every year, countless hours and significant resources are lost because of poorly written code.
      But it doesn’t have to be that way.
      Noted software expert Robert C. Martin presents a revolutionary paradigm with Clean Code:
      A Handbook of Agile Software Craftsmanship .
      Martin has teamed up with his colleagues from Object Mentor to distill their best agile practice of
      cleaning code “on the fly” into a book that will instill within you the values of a software craftsman and
      make you a better programmer—but only if you work at it.
      What kind of work will you be doing? You’ll be reading code—lots of code.
      And you will be challenged to think about what’s right about that code, and what’s wrong with it.
      More importantly, you will be challenged to reassess your professional values and your commitment to your craft.
      Clean Code is divided into three parts. The first describes the principles,
      patterns, and practices of writing clean code.
      The second part consists of several case studies of increasing complexity.
      Each case study is an exercise in cleaning up code—of transforming a code base that has some problems into
      one that is sound and efficient. The third part is the payoff:
      a single chapter containing a list of heuristics and “smells” gathered while creating the case studies.
      The result is a knowledge base that describes the way we think when we write, read, and clean code.
      Readers will come away from this book understanding
      How to tell the difference between good and bad code
      How to write good code and how to transform bad code into good code
      How to create good names, good functions, good objects, and good classes
      How to format code for maximum readability
      How to implement complete error handling without obscuring code logic
      How to unit test and practice test-driven development
      This book is a must for any developer, software engineer, project manager, team lead, or systems analyst with an
      interest in producing better code.',
      image: 'clean_code_img.jpg', status: 'In')
    Book.create(name: 'Ruby on Rails Tutorial (Rails 5)', author: 'Michael Hartl', description: 'Newly updated for
      Rails 5, the Ruby on Rails Tutorial book and screencast series teach you how to develop and deploy real,
      industrial-strength web applications with Ruby on Rails, the open-source web framework that powers top websites
      such as Twitter, Hulu, GitHub, and the Yellow Pages.
      The Ruby on Rails Tutorial book is available for free online and is available for purchase as an ebook
      (PDF, EPUB, and MOBI formats).
      The companion screencast series includes 14 individual lessons, one for each chapter of the
      Ruby on Rails Tutorial book.',
      image: 'rails_tutorial_img.png', status: 'In')
    Book.create(name: 'SQL QuickStart Guide', author: 'ClydeBank Technology', description: 'Structured Query Language
      or SQL (pronounced sequel by many) is the most widely used programming language used in database management and is
      the standard language for Relational Database Management Systems (RDBMS). SQL programming allows users to return,
      analyze, create, manage and delete data within a database – all within a few commands.
      With more industries and organizations looking to the power of data, the need for an efficient,
      scalable solution for data management is required.
      More often than not, organizations implement a Relational Database Management System in one form or another.
      These systems create long-term data “warehouses” that can be easily accessed to return and analyze results,
      such as, “Show me all of the clients from Canada that have purchased more than $20,000 in the last 3 years.”
      This “query,” which would have taken an extensive amount of hands-on research to complete prior to the use
      of database, can now be determined in seconds by executing a simple SELECT SQL statement on a database.
      SQL can seem daunting to those with little to zero programming knowledge and can even pose a challenge
      to those that have experience with other languages.
      Most resources jump right into the technical jargon and are not suited for someone to really grasp how SQL
      Actually Works. That’s why we created this book.
      Our goal here is simple: show you exactly everything you need to know to utilize SQL in whatever capacity you may
      need in simple, easy to follow concepts.
      Our book provides Multiple Step-by-Step Examples of how to master these SQL concepts to ensure you know what
      you’re doing and why you’re doing it every step of the way.
      This book will allow you to successfully go from knowing absolutely nothing about SQL to being able to
      quickly retrieve and analyze data from multiple tables.
      Step-by-step we will Walk You Through the Fundamentals of Understanding How a Relational Database is
      Structured to how to execute Complex SELECT Statements to return large datasets from your database.',
      image: 'sql_qsg_img.jpg', status: 'In')
    Book.create(name: 'SQL: The Ultimate Beginners Guide', author: 'Steve Tale',
      description: 'Learning the SQL language can be laborious and tedious, but if you have genuine interest in
      learning a new language and updating your skills, it could be relatively easy. In this book, all the basic
      information that you need to learn as a beginner are presented. All you have to do is to apply them.
      This book will serve as an essential guide for you, as a SQL beginner.
      In addition, the concepts of SQL are laid out in a simple, concise language and instructions to help you
      learn the steps properly. Specific examples and sample tables is showcased to help you practice most of
      the SQL queries.',
      image: 'sql_beginners_guide_img.jpg', status: 'In')
    Book.create(name: 'S Q L: The Ultimate Guide From Beginner To Expert', author: 'Peter Adams',
      description: 'Are you looking for more ways on how to improve your SQL skill?
      Do you want to see your database in an organised fashion?
      Well if you answered “yes”, then read on!
      Structured Query Language or SQL is famously used to interact with database.
      You may be working at a hotel, bank, government, or any industry,
      SQL is certainly a necessity to run your daily operations!
      SQL: The Ultimate Guide From Beginner To Expert – Learn And Master SQL In No Time
      is a book that will introduce you to a computer language that has helped so many business
      owners and information technologists with daily reports and database management without the fear of crashing.
      Here’s what you’ll find inside:
      The Fundamentals of SQL
      The Syntax of SQL
      Data Types in SQL
      The Basics of Functions in SQL
      A Guide to Scalar Functions
      Creating a Table in SQL
      Recommendations
      If you think it’s that complicated, well it isn’t! Peter Adams,
      the author of this book made this especially easy-to-read for both beginners and soon to be experts!
      Not to mention the Special Chapter called "Recommendations" where you can find great and valuable Products!
      Just hop in on Chapter 7 to find out!
      This will be an exciting journey for both business owners and individuals who are seeking for a high paying job!
      Yes! We said it! Developing your SQL skill can help you earn good money!
      So what are you waiting for?!
      BUY your own copy TODAY and have fun with it!
      Good Luck!',
      image: 'sql_ugfbte_img.jpg', status: 'In')
    Book.create(name: 'SQL in 10 Minutes', author: 'Ben Forta',
      description: 'Whether you are an application developer, database administrator, web application designer,
      mobile app developer, or Microsoft Office users, a good working knowledge of SQL is an important part of
      interacting with databases. And Sams Teach Yourself SQL in 10 Minutes offers the straightforward, practical
      answers you need to help you do your job.
      Expert trainer and popular author Ben Forta teaches you just the parts of SQL you need to know–starting with
      simple data retrieval and quickly going on to more complex topics including the use of joins, subqueries,
      stored procedures, cursors, triggers, and table constraints.
      You will learn methodically, systematically, and simply–in 22 short, quick lessons that will each take
      only 10 minutes or less to complete.
      With the Fourth Edition of this worldwide bestseller, the book has been thoroughly updated, expanded,
      and improved. Lessons now cover the latest versions of IBM DB2, Microsoft Access, Microsoft SQL Server,
      MySQL, Oracle, PostgreSQL, SQLite, MariaDB, and Apache Open Office Base. And new full-color SQL code listings
      help the beginner clearly see the elements and structure of the language.
      10 minutes is all you need to learn how to...
      Use the major SQL statements
      Construct complex SQL statements using multiple clauses and operators
      Retrieve, sort, and format database contents
      Pinpoint the data you need using a variety of filtering techniques
      Use aggregate functions to summarize data
      Join two or more related tables
      Insert, update, and delete data
      Create and alter database tables
      Work with views, stored procedures, and more',
      image: 'sql_10_min_img.jpg', status: 'In')
    Book.create(name: 'JavaScript and JQuery: Interactive Front-End Web Development', author: 'Jon Duckett',
      description: 'This full-color book will show you how to make your websites more interactive and your interfaces
      more interesting and intuitive.
      THIS BOOK COVERS:
      Basic programming concepts - assuming no prior knowledge of programming beyond an ability to create a web page
      using HTML & CSS
      Core elements of the JavaScript language - so you can learn how to write your own scripts from scratch
      jQuery - which will allow you to simplify the process of writing scripts (this is introduced half-way through
      the book once you have a solid understanding of JavaScript)
      How to recreate techniques you will have seen on other web sites such as sliders, content filters,
      form validation, updating content using Ajax, and much more (these examples demonstrate writing your
      own scripts from scratch and how the theory you have learned is put into practice).
      As with our first book (the best-selling HTML & CSS: Design and Build Websites), each chapter:
      Breaks subjects down into bite-sized chunks with a new topic on each page
      Contains clear descriptions of syntax, each one demonstrated with inspiring code samples
      Uses diagrams and photography to explain complex concepts in a visual way
      By the end of the book, not only will you be able to use the thousands of scripts, JavaScript APIs,
      and jQuery plugins that are freely available on the web, and be able to customize them -
      you will also be able to create your own scripts from scratch.
      If you are looking to create more enriching web experiences, then this is the book for you.',
      image: 'javascript_jquery_book_img.jpg', status: 'In')
    Book.create(name: 'JavaScript & jQuery: The Missing Manual', author: 'David Sawyer McFarland ',
      description: 'JavaScript lets you supercharge your HTML with animation, interactivity,
      and visual effects—but many web designers find the language hard to learn.
      This easy-to-read guide not only covers JavaScript basics, but also shows you how to
      save time and effort with the jQuery and jQuery UI libraries of prewritten JavaScript code.
      You’ll build web pages that feel and act like desktop programs—with little or no programming.
      The important stuff you need to know:
      Pull back the curtain on JavaScript. Learn how to build a basic program with this language.
      Get up to speed on jQuery. Quickly assemble JavaScript programs that work well on multiple web browsers.
      Transform your user interface. Learn jQuery UI, the JavaScript library for interface features like design
      themes and controls.
      Make your pages interactive. Create JavaScript events that react to visitor actions.
      Use animations and effects. Build drop-down navigation menus, pop-ups, automated slideshows, and more.
      Collect data with web forms. Create easy-to-use forms that ensure more accurate visitor responses.
      Practice with living examples. Get step-by-step tutorials for web projects you can build yourself.',
      image: 'jquery_missing_manual_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery in Action', author: 'Bear Bibeault',
      description: 'Summary
      jQuery in Action, Third Edition, is a fast-paced and complete guide to jQuery, focused on the tasks you will face
      in nearly any web dev project. Written for readers with minimal JavaScript experience, this revised edition
      adds new examples and exercises, along with the deep and practical coverage you expect from an In Action book.
      You will learn how to traverse HTML documents, handle events, perform animations, write plugins, and even unit
      test your code. The unique lab pages anchor each concept with real-world code. Several new chapters teach you
      how to interact with other tools and frameworks to build modern single-page web applications.',
      image: 'jquery_in_action_3rd_edition_bookcover_img.jpg', status: 'In')
    Book.create(name: 'Learning jQuery Fourth Edition', author: 'Jonathan Chaffer ',
      description: 'To build interesting, interactive sites, developers are turning to JavaScript libraries such
      as jQuery to automate common tasks and simplify complicated ones. Because many web developers have more
      experience with HTML and CSS than with JavaScript, the library`s design lends itself to a quick start for
      designers with little programming experience. Experienced programmers will also be aided by its conceptual
      consistency.
      LearningjQuery: Fourth Edition is revised and updated version of jQuery. You will learn the basics of jQuery
      for adding interactions and animations to your pages. Even if previous attempts at writing JavaScript have
      left you baffled, this book will guide you past the pitfalls associated with AJAX, events, effects,
      and advanced JavaScript language features.
      Starting with an introduction to jQuery, you will first be shown how to write a functioning jQuery program
      in just three lines of code. Learn how to add impact to your actions through a set of simple visual effects
      and to create, copy, reassemble, and embellish content using jQuery`s DOM modification methods.
      The book will take you through many detailed, real-world examples, and even equip you to extend the
      jQuery library itself with your own plug-ins.',
      image: 'learning_jquery_fourth_edition_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery Pocket Reference: Read Less, Learn More', author: 'David Flanagan',
      description: '"As someone who uses jQuery on a regular basis, it was surprising to discover how much of
      the library I’m not using. This book is indispensable for anyone who is serious about using jQuery for
      non-trivial applications."-- Raffaele Cecco, longtime developer of video games, including Cybernoid,
      Exolon, and Stormlord jQuery is the "write less, do more" JavaScript library.
      Its powerful features and ease of use have made it the most popular client-side JavaScript framework for the Web.
      Ideal for JavaScript developers at all skill levels, this book is jQuery`s trusty companion:
      the definitive "read less, learn more" guide to the library.
      jQuery Pocket Reference explains everything you need to know about jQuery, completely and comprehensively.
      You will learn how to:
      Select and manipulate document elements
      Alter document structure
      Handle and trigger events
      Create visual effects and animations
      Script HTTP with Ajax utilities
      Use jQuery`s selectors and selection methods, utilities, plugins and more
      The 25-page quick reference summarizes the library, listing all jQuery methods and functions,
      with signatures and descriptions.',
      image: 'jquery_pocket_reference_book_img.jpg', status: 'In')
    Book.create(name: 'A Smarter Way to Learn jQuery: Learn it faster. Remember it longer.', author: 'Mark Myers',
      description: 'You’re going to get the hang of jQuery in less time than you might expect.
      And the knowledge will stick. Why? Because this isn’t just a book.
      It’s a book plus 1,500 free interactive online exercises.
      It’s the exercises that are going to turn you into a real jQuery coder.
      Cognitive research shows that reading alone doesn’t buy you much long-term retention.
      But if you read less and do more—if you read a short passage and then immediately put
      it into practice—everything changes. Washington University researchers say that being asked to
      retrieve information increases long-term retention by four hundred percent.
      Practice also makes learning more interesting.
      Ten minutes of reading followed by twenty minutes of practice keeps you awake and spurs you on.
      And it keeps you honest. If you only read, it’s easy to kid yourself that you’re learning more than you are.
      But when you’re challenged to produce the goods, there’s a moment of truth.
      You know that you know—or that you don’t.
      If you find you’re a little shaky on this point or that, you can review the material, then re-do the exercise.
      That’s all it takes to master this book from beginning to end.',
      image: 'smarter_way_to_learn_jquery_img.jpg', status: 'In')
    Book.create(name: 'Mastering jQuery', author: 'Alex Libby',
      description: 'About This Book Create and decouple custom event types to efficiently use them and suit your users
      needs Incorporate custom, optimized versions of the jQuery library into your pages to maximize the efficiency
      of your website Get the most out of jQuery by gaining exposure to real-world examples with tricks and tips
      to enhance your skills',
      image: 'mastering_jquery_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery, jQuery UI, and jQuery Mobile', author: 'Adriaan de Jonge',
      description: 'jQuery makes it easier than ever for developers to build exceptionally robust,
      cross-platform websites and mobile apps. jQuery, jQuery UI, and jQuery Mobile: Recipes and Examples is
      a practical “cookbook,” packed with realistic, easy-to-use solutions for making the most of jQuery Core,
      jQuery UI, plugins, and jQuery Mobile.',
      image: 'jquery_ui_mobile_recipes_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery Design Patterns', author: 'Thodoris Greasidis',
      description: 'The book starts off with a refresher to jQuery and will then take you through the
      different design patterns such as facade, observer, publisher/subscriber, and so on.
      We will also go into client-side templating techniques and libraries,
      as well as some plugin development patterns.
      Finally, we will look into some best practices that you can use to make the best of jQuery.',
      image: 'jquery_design_patterns_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery Cookbook: Solutions & Examples for jQuery Developers', author: 'Cody Lindley',
      description: 'jQuery simplifies building rich, interactive web frontends.
      Getting started with this JavaScript library is easy,
      but it can take years to fully realize its breadth and depth;
      this cookbook shortens the learning curve considerably. With these recipes,
      you will learn patterns and practices from 19 leading developers who use
      jQuery for everything from integrating simple components into websites and applications to developing complex,
      high-performance user interfaces.',
      image: 'jquery_cookbook_cover_img.jpg', status: 'In')
    Book.create(name: 'jQuery UI in Action', author: 'T. J. VanToll',
      description: 'jQuery UI in Action is a practical guide to using and customizing jQuery UI library components
      to build rich, user-friendly web applications. By working through numerous engaging examples, you will move
      quickly from placing a datepicker on the page to building a complete user interface that includes features like
      a contact form and shopping cart. You will master jQuery UI`s five main interactions—draggable,
      droppable, resizable, selectable, and sortable—and learn UI techniques that work across all devices.
      Purchase of the print book includes a free eBook in PDF, Kindle, and ePub formats from Manning Publications.',
      image: 'jqueryui_in_action_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery UI 1.10: The User Interface Library for jQuery', author: 'Alex Libby',
      description: 'jQuery UI, the official UI widget library for jQuery, gives you a solid platform on which to
      build rich and engaging interfaces quickly, with maximum compatibility, stability, and effort.
      jQuery UI`s ready-made widgets help to reduce the amount of code that you need to write to take a project
      from conception to completion.jQuery UI, the official UI widget library for jQuery, gives you a solid
      platform on which to build rich and engaging interfaces quickly, with maximum compatibility, stability,
      and effort. jQuery UIs ready-made widgets help to reduce the amount of code that you need to write to take
      a project from conception to completion.jQuery UI, the official UI widget library for jQuery, gives you a
      solid platform on which to build rich and engaging interfaces quickly, with maximum compatibility, stability,
      and effort. jQuery UIs ready-made widgets help to reduce the amount of code that you need to write to
      take a project from conception to completion.jQuery UI, the official UI widget library for jQuery,
      gives you a solid platform on which to build rich and engaging interfaces quickly, with maximum compatibility,
      stability, and effort. jQuery UIs ready-made widgets help to reduce the amount of code that you need to write
      to take a project from conception to completion.',
      image: 'jquery_ui_110_book_img.jpg', status: 'In')
    Book.create(name: 'jQuery UI: Learn How to use Dialogs, Autocomplete, and More', author: 'Eric Sarrion',
      description: 'With the jQuery UI library, you can apply the power and standards of jQuery to user interface
      design, complete with interactive elements, animation, and themeable widgets.
      This concise, code-heavy guide demonstrates how to harness interactive features that HTML5 lacks,
      including tabs, accordions, and dialog boxes. You’ll also learn how to program common but complex tasks,
      such as managing drag and drop and autocomplete, that make it easier for users to interact with your site.',
      image: 'jquery_ui_oreilly_book_img.jpg', status: 'In')
    Book.create(name: 'Mastering jQuery UI', author: 'Vijay Joshi',
      description: 'Mastering jQuery UI will help you explore the depths of the jQuery UI library.
      Right from the first chapter, you will build your own projects while learning the intricacies of the library.
      Each chapter explores a new topic and covers some related components. By gaining confidence from the initial
      chapters you will proceed ahead to create complex applications like the Tabbed News reader utilizing the AJAX
      and Reddit APIs. As a bonus, you will also learn about the best and most proven practices earned through years
      of diligent work on the jQuery UI platform.',
      image: 'mastering_jquery_ui_book_img.jpg', status: 'In')
  end
end