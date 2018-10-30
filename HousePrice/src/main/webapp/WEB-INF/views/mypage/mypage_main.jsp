<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<%@ include file="../include/main_header.jsp"%>
<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">마이 페이지</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">마이페이지</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <section class="bar">
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <!-- MENUS AND WIDGETS -->
              <div class="panel panel-default sidebar-menu with-icons">
                <div class="panel-heading">
                  <h3 class="h4 panel-title">Categories</h3>
                </div>
                <div class="panel-body">
                  <ul class="nav nav-pills flex-column text-sm">
                    <li class="nav-item"><a href="/question/mypage?mid=${login.mid}" class="nav-link">내 질문</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">내 답변</a></li>
                    <li class="nav-item"><a href="/register/detail" class="nav-link">회원정보 수정</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-lg-9">
              <div id="accordion" role="tablist" class="mb-5">
                <div class="card">
                  <div id="headingOne" role="tab" class="card-header">
                    <h5 class="mb-0"><a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Accordion Item No.1</a></h5>
                  </div>
                  <div id="collapseOne" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion" class="collapse show">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-4"><img src="${path}/user/img/template-easy-customize.png" alt="" class="img-fluid"></div>
                        <div class="col-md-8">
                          <p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                          <p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.                                    </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div id="headingTwo" role="tab" class="card-header">
                    <h5 class="mb-0"><a data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed">Accordion Item No.2</a></h5>
                  </div>
                  <div id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-4"><img src="${path}/user/img/template-easy-code.png" alt="" class="img-fluid"></div>
                        <div class="col-md-8">
                          <p>It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p>
                          <p>It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div id="headingThree" role="tab" class="card-header">
                    <h5 class="mb-0"><a data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed">Accordion Item No.3 A little too small</a></h5>
                  </div>
                  <div id="collapseThree" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
                    <div class="card-body">His room, a proper human room although a little too small, lay peacefully between its four familiar walls.<br>A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
	<%@ include file="../include/main_footer.jsp"%>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>