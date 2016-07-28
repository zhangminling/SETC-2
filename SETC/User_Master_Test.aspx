﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Master_Test.aspx.cs" Inherits="User_Master_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Master</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" />
<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" />
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" />
<script type="text/javascript" src="css/jquery.js"></script>
<script type="text/javascript" src="css/switcher.js"></script>
</head>
<body>
    <form id="form1" runat="server">
<div id="main">
  <!-- Tray -->
  <div id="tray" class="box">
    <p class="f-left box">
      <!-- Switcher -->
      <span class="f-left" id="switcher"> <a href="javascript:void(0);" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="images/users/switcher-1col.gif" alt="1 Column" /></a> <a href="javascript:void(0)" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="images/users/switcher-2col.gif" alt="" /></a> </span> 教育技术与传播学院： <strong><a href="#">后台管理</a></strong> </p>
    <p class="f-right">User: <strong><a href="#">Administrator</a></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="#" id="logout">Log out</a></strong></p>
  </div>
  <!--  /tray -->
  <hr class="noscreen" />
  <!-- /header -->
  <hr class="noscreen" />
  <!-- Columns -->
  <div id="cols" class="box">
    <!-- Aside (Left Column) -->
    <div id="aside" class="box">
      <div class="padding box">
        <!-- Logo (Max. width = 200px) -->
        <p id="logo"><a href="#"><img src="tmp/logo.gif" alt="" /></a></p>
        <!-- Search -->
        <form action="#" method="get" id="search">
          <fieldset>
          <legend>Search</legend>
          <p>
            <input type="text" size="17" name="" class="input-text" />
            &nbsp;
            <input type="submit" value="OK" class="input-submit-02" />
            <br />
            <a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p>
          <!-- Advanced search -->
          <div id="search-options" style="display:none;">
            <p>
              <label>
              <input type="checkbox" name="" checked="checked" />
              Option I.</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              Option II.</label>
              <br />
              <label>
              <input type="checkbox" name="" />
              Option III.</label>
            </p>
          </div>
          <!-- /search-options -->
          </fieldset>
        </form>
        <!-- Create a new project -->
        <p id="btn-create" class="box"><a href="#"><span>Create a new project</span></a></p>
      </div>
      <!-- /padding -->
      <ul class="box">
        <li><a href="#">Lorem ipsum</a></li>
        <li><a href="#">Lorem ipsum</a></li>
        <li><a href="#">Lorem ipsum</a></li>
        <li id="submenu-active"><a href="#">Active Page</a>
          <!-- Active -->
          <ul>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum</a></li>
          </ul>
        </li>
        <li><a href="#">Lorem ipsum</a></li>
        <li><a href="#">Lorem ipsum</a>
          <ul>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum</a></li>
            <li><a href="#">Lorem ipsum</a></li>
          </ul>
        </li>
        <li><a href="#">Lorem ipsum</a></li>
      </ul>
    </div>
    <!-- /aside -->
    <hr class="noscreen" />
    <!-- Content (Right Column) -->
    <div id="content" class="box">
      <h1>Styles</h1>
      <!-- Headings -->
      <h2>Heading H2</h2>
      <h3>Heading H3</h3>
      <h4>Heading H4</h4>
      <h5>Heading H5</h5>
      <!-- System Messages -->
      <h3 class="tit">System Messages</h3>
      <p class="msg warning">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <p class="msg info">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <p class="msg done">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <p class="msg error">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <!-- Tabs -->
      <h3 class="tit">Tabs</h3>
      <div class="tabs box">
        <ul>
          <li><a href="#tab01"><span>Lorem ipsum</span></a></li>
          <li><a href="#tab02"><span>Lorem ipsum</span></a></li>
          <li><a href="#tab03"><span>Lorem ipsum</span></a></li>
        </ul>
      </div>
      <!-- /tabs -->
      <!-- Tab01 -->
      <div id="tab01">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
      <!-- /tab01 -->
      <!-- Tab02 -->
      <div id="tab02">
        <p>Donec ornare, libero vitae facilisis molestie, mi sapien venenatis felis, sed mattis lectus nisi ac massa.</p>
      </div>
      <!-- /tab02 -->
      <!-- Tab03 -->
      <div id="tab03">
        <p>Nam ut lorem eu orci placerat iaculis.</p>
      </div>
      <!-- /tab03 -->
      <!-- 2 columns -->
      <h3 class="tit">2 Columns (50-50)</h3>
      <div class="col50">
        <p class="t-justify">嗨! 欢迎使用巴巴唔模板网提供的网页模板,你可以免费将此模板应用与任何地方,个人网站或者商业应用,唯一需要做的就是在此页面保留<a href="http://www.88web.org">巴巴唔模板网</a>的相关链接.或加入友情链接 volutpat a, bibendum quis, placerat vitae, enim. Etiam consectetur, velit in viverra tempus, urna augue sollicitudin tellus, vitae interdum arcu mi at est. Donec ornare, libero vitae facilisis molestie, mi sapien venenatis felis, sed mattis lectus nisi ac massa. Cras suscipit, neque ac auctor interdum, pede nibh porta lectus, nec aliquet nulla ipsum ac nibh. Morbi feugiat ipsum id metus. In urna sapien, porttitor sed, consectetur quis, lacinia eu, ante. Donec at ipsum. Sed arcu tellus, dapibus sit amet, auctor nec, rutrum non, lacus. Nam ut lorem eu orci placerat iaculis. Proin bibendum. Suspendisse consequat.</p>
      </div>
      <!-- /col50 -->
      <div class="col50 f-right">
        <p class="t-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et risus. Maecenas non nunc. Proin eleifend viverra sapien. Donec id augue. Duis erat nunc, volutpat a, bibendum quis, placerat vitae, enim. Etiam consectetur, velit in viverra tempus, urna augue sollicitudin tellus, vitae interdum arcu mi at est. Donec ornare, libero vitae facilisis molestie, mi sapien venenatis felis, sed mattis lectus nisi ac massa. Cras suscipit, neque ac auctor interdum, pede nibh porta lectus, nec aliquet nulla ipsum ac nibh. Morbi feugiat ipsum id metus. In urna sapien, porttitor sed, consectetur quis, lacinia eu, ante. Donec at ipsum. Sed arcu tellus, dapibus sit amet, auctor nec, rutrum non, lacus. Nam ut lorem eu orci placerat iaculis. Proin bibendum. Suspendisse consequat.</p>
      </div>
      <!-- /col50 -->
      <div class="fix"></div>
      <!-- 3 columns -->
      <h3 class="tit">3 Columns (33-33-33)</h3>
      <div class="col33">
        <p class="t-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et risus. Maecenas non nunc. Proin eleifend viverra sapien. Donec id augue. Duis erat nunc, volutpat a, bibendum quis, placerat vitae, enim. Etiam consectetur, velit in viverra tempus, urna augue sollicitudin tellus, vitae interdum arcu mi at est. Donec ornare, libero vitae facilisis molestie, mi sapien venenatis felis, sed mattis lectus nisi ac massa. Cras suscipit, neque ac auctor interdum, pede nibh porta lectus, nec aliquet nulla ipsum ac nibh. Morbi feugiat ipsum id metus. In urna sapien, porttitor sed, consectetur quis, lacinia eu, ante. Donec at ipsum. Sed arcu tellus, dapibus sit amet, auctor nec, rutrum non, lacus. Nam ut lorem eu orci placerat iaculis. Proin bibendum. Suspendisse consequat.</p>
      </div>
      <!-- /col33 -->
      <div class="col33 center">
        <p class="t-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et risus. Maecenas non nunc. Proin eleifend viverra sapien. Donec id augue. Duis erat nunc, volutpat a, bibendum quis, placerat vitae, enim. Etiam consectetur, velit in viverra tempus, urna augue sollicitudin tellus, vitae interdum arcu mi at est. Donec ornare, libero vitae facilisis molestie, mi sapien venenatis felis, sed mattis lectus nisi ac massa. Cras suscipit, neque ac auctor interdum, pede nibh porta lectus, nec aliquet nulla ipsum ac nibh. Morbi feugiat ipsum id metus. In urna sapien, porttitor sed, consectetur quis, lacinia eu, ante. Donec at ipsum. Sed arcu tellus, dapibus sit amet, auctor nec, rutrum non, lacus. Nam ut lorem eu orci placerat iaculis. Proin bibendum. Suspendisse consequat.</p>
      </div>
      <!-- /col33 -->
      <div class="col33">
        <p class="t-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et risus. Maecenas non nunc. Proin eleifend viverra sapien. Donec id augue. Duis erat nunc, volutpat a, bibendum quis, placerat vitae, enim. Etiam consectetur, velit in viverra tempus, urna augue sollicitudin tellus, vitae interdum arcu mi at est. Donec ornare, libero vitae facilisis molestie, mi sapien venenatis felis, sed mattis lectus nisi ac massa. Cras suscipit, neque ac auctor interdum, pede nibh porta lectus, nec aliquet nulla ipsum ac nibh. Morbi feugiat ipsum id metus. In urna sapien, porttitor sed, consectetur quis, lacinia eu, ante. Donec at ipsum. Sed arcu tellus, dapibus sit amet, auctor nec, rutrum non, lacus. Nam ut lorem eu orci placerat iaculis. Proin bibendum. Suspendisse consequat.</p>
      </div>
      <!-- /col33 -->
      <div class="fix"></div>
      <!-- Text Alignment -->
      <h3 class="tit">Text Alignment</h3>
      <p class="t-left">Left <span class="tag">(.t-left)</span></p>
      <p class="t-center">Center <span class="tag">(.t-center)</span></p>
      <p class="t-right">Right <span class="tag">(.t-right)</span></p>
      <!-- Size and Highlight -->
      <h3 class="tit">Text Size and Highlight</h3>
      <p>Lorem ipsum dolor sit amet</p>
      <p><strong>Lorem ipsum dolor sit amet</strong> <span class="tag">(&lt;strong&gt;)</span></p>
      <p><em>Lorem ipsum dolor sit amet</em> <span class="tag">(&lt;em&gt;)</span></p>
      <p><abbr>Lorem ipsum dolor sit amet</abbr> <span class="tag">(&lt;abbr&gt;)</span></p>
      <p><acronym>Lorem ipsum dolor sit amet</acronym> <span class="tag">(&lt;acronym&gt;)</span></p>
      <p><code>Lorem ipsum dolor sit amet</code> <span class="tag">(&lt;code&gt;)</span></p>
      <p><span class="help">Lorem ipsum dolor sit amet</span> <span class="tag">(.help)</span></p>
      <p><span class="high">Lorem ipsum dolor sit amet</span> <span class="tag">(.high)</span></p>
      <p><span class="low">Lorem ipsum dolor sit amet</span> <span class="tag">(.low)</span></p>
      <p><span class="bigger">Lorem ipsum dolor sit amet</span> <span class="tag">(.bigger)</span></p>
      <p><span class="smaller">Lorem ipsum dolor sit amet</span> <span class="tag">(.smaller)</span></p>
      <!-- Unordered List -->
      <h3 class="tit">Unordered List - <span class="tag">(ul.nostyle)</span></h3>
      <ul class="nostyle">
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet
          <ul>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet
              <ul>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
              </ul>
            </li>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet</li>
          </ul>
        </li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
      </ul>
      <!-- Unordered List -->
      <h3 class="tit">Unordered List</h3>
      <ul>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet
          <ul>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet
              <ul>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
              </ul>
            </li>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet</li>
          </ul>
        </li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
      </ul>
      <!-- Ordered List (OL) -->
      <h3 class="tit">Ordered List</h3>
      <ol>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet
          <ol>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet
              <ol>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
                <li>Lorem ipsum dolor sit amet</li>
              </ol>
            </li>
            <li>Lorem ipsum dolor sit amet</li>
            <li>Lorem ipsum dolor sit amet</li>
          </ol>
        </li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
      </ol>
      <!-- Table -->
      <h3 class="tit">Table <span class="tag">(table.nostyle)</span></h3>
      <table class="nostyle">
        <tr>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
      </table>
      <!-- Table (TABLE) -->
      <h3 class="tit">Table</h3>
      <table>
        <tr>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
          <th>Lorem ipsum</th>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr class="bg">
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr class="bg">
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
        <tr>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
          <td>Lorem ipsum</td>
        </tr>
      </table>
      <!-- Form -->
      <h3 class="tit">Form</h3>
      <fieldset>
      <legend>Legend</legend>
      <table class="nostyle">
        <tr>
          <td style="width:70px;">Input:</td>
          <td><input type="text" size="40" name="" class="input-text" /></td>
        </tr>
        <tr>
          <td>Input:</td>
          <td><input type="text" size="40" name="" class="input-text" disabled="disabled" /></td>
        </tr>
        <tr>
          <td class="va-top">Input:</td>
          <td><textarea cols="75" rows="7" class="input-text"></textarea></td>
        </tr>
        <tr>
          <td>Input:</td>
          <td><label>
            <input type="checkbox" />
            Lorem ipsum</label>
            &nbsp;
            <label>
            <input type="checkbox" />
            Lorem ipsum</label>
            &nbsp;
            <label>
            <input type="checkbox" />
            Lorem ipsum</label>
          </td>
        </tr>
        <tr>
          <td>Input:</td>
          <td><label>
            <input type="radio" />
            Lorem ipsum</label>
            &nbsp;
            <label>
            <input type="radio" />
            Lorem ipsum</label>
            &nbsp;
            <label>
            <input type="radio" />
            Lorem ipsum</label>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="t-right"><input type="submit" class="input-submit" value="Submit" /></td>
        </tr>
      </table>
      </fieldset>
      <!-- Definition List -->
      <h3 class="tit">Definition List <span class="tag">(dl.nostyle)</span></h3>
      <dl class="nostyle">
        <dt>Lorem ipsum</dt>
        <dd>Lorem ipsum dolor sit amet.</dd>
        <dt>Lorem ipsum</dt>
        <dd>Lorem ipsum dolor sit amet.</dd>
        <dt>Lorem ipsum</dt>
        <dd>Lorem ipsum dolor sit amet.</dd>
      </dl>
      <!-- Definition List -->
      <h3 class="tit">Definition List</h3>
      <dl>
        <dt>Lorem ipsum</dt>
        <dd>Lorem ipsum dolor sit amet.</dd>
        <dt>Lorem ipsum</dt>
        <dd>Lorem ipsum dolor sit amet.</dd>
        <dt>Lorem ipsum</dt>
        <dd>Lorem ipsum dolor sit amet.</dd>
      </dl>
    </div>
    <!-- /content -->
  </div>
  <!-- /cols -->
  <hr class="noscreen" />
  <!-- Footer -->
  <div id="footer" class="box">
    <p class="f-left">&copy; 2009 <a href="#">Your Company</a>, All Rights Reserved &reg;</p>
    <p class="f-right">Templates by <a href="http://www.88web.org/" title="免费网站模板下载">巴巴唔模板网</a></p>
  </div>
  <!-- /footer -->
</div>
<!-- /main -->
    </form>
</body>
</html>