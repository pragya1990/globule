<html><head>
  <title>Test Page for Apache/Globule Installation</title>
  <link href="Globule.css" rel="stylesheet" title="preferred" />
</head><body>
  <table class="pagemain"><tr><td>
    <img src="globule.png" align="right" />
    <h1>Welcome to Apache/Globule</h1>
    <hr class="titlehr"/>
    <h2>Introduction</h2>
    <hr class="sectionhr"/>
    <p>
    If you can see this, it means that the installation of the <a
    href="http://www.apache.org/foundation/preFAQ.html">Apache web
    server</a> software on this system was successful.  This installation
    should include the <a href="http://www.globule.org/">Globule</a>
    module, which will use replication to build better performing sites.
    You may now add content to this directory and replace this page.
    </p>
    <h2>Sanity tests and Apache status</h2>
    <hr class="sectionhr"/>
    <p>
    To test whether this web server is properly executing replicated PHP
    scripts, look whether <a href="globule/test.php">this</a> page shows as
    a normal web page and without any error messages.
    </p>
    <p>
    When accessing the web server from the local host, you can access
    the Apache <a href="/server-info">server-info</a>
    and <a href="/server-status">server-status</a>
    pages.<br/>
    The server-info and status are only available through the localhost
    because of security reasons.
    </p>
    <h2>Demo</h2>
    <hr class="sectionhr"/>
    <p>
    A demo page available in both <a href="globule/demo.html">plain HTML</a>
    as well as <a href="globule/demo.php">using PHP</a> is available to show
    whether pages are actively being replicated to other sites.
    <p>
    You can also have a look at the <a href="/globuleadm/">Globule
    Controls</a> which allow for inspecting some status information and
    changing parameters, which are currently also limited in access.
    </p>
  <br/><br/><br/><br/><br/><br/>
  </td></tr></table>
</body></html>
