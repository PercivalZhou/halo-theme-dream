<#macro article_list posts>
    <#list posts as post>
        <#assign thumbnail = (post.thumbnail?? && post.thumbnail!='')?then(post.thumbnail!, (settings.default_thumbnail?? && settings.default_thumbnail!='')?then(settings.default_thumbnail + settings.default_thumbnail?contains('?')?then("&","?") + "postId=" + post.id?c, ''))>
        <#assign thumbnail_mode = (post.metas?? && post.metas.thumbnail_mode?? && post.metas.thumbnail_mode?trim!='')?then(post.metas.thumbnail_mode?trim, (post.topPriority==1)?then(settings.top_thumbnail_mode!'back', settings.thumbnail_mode!'default'))>
        <div class="card widget">
            <#if thumbnail != '' && thumbnail_mode == "back">
                <div class="cover">
                    <a href="${post.fullPath!}">
                        <div class="cover-image" style="background-image: url(${thumbnail!})">
                        </div>
                        <div class="details">
                            <h2 class="title"><#if post.topPriority==1><span class="top">置顶</span></#if>${post.title!}</h2>
                            <ul class="breadcrumb">
                                <li><@global.timeline datetime=post.createTime/></li>
                                <li><i class="fa fa-eye"></i>${post.visits?c}</li>
                                <#if !post.disallowComment!false><li><i class="fa fa-comments-o"></i>${post.commentCount?c}</li></#if>
                                <li><i class="fa fa-thumbs-o-up"></i>${post.likes?c}</li>
                                <#assign heat= (24+post.visits*0.1+post.likes*2+post.commentCount*3) />
                                <#assign heatColor= '#'+(heat < 37)?string('ffa87e',(heat < 120)?string('fb734a','e0081c')) />
                                <li style="color: ${heatColor}">${heat}℃</li>
                            </ul>
                        </div>
                    </a>
                    <#if post.categories?? && post.categories?size gt 0>
                        <div class="category">
                            <#list post.categories as category>
                                <a href="${category.fullPath!}">${category.name!}</a>
                            </#list>
                        </div>
                    </#if>
                </div>
            <#elseif thumbnail != '' && (thumbnail_mode == "small" || (thumbnail_mode == "small-alter" && post_index%2 == 0))>
                <div class="card-small">
                    <a href="${post.fullPath!}"><div class="small-image" style="background-image: url(${thumbnail!})"></div></a>
                    <div class="card-content main">
                        <h2 class="title">
                            <#if post.topPriority==1><span class="top">置顶</span></#if><a
                                    href="${post.fullPath!}">${post.title!}</a>
                        </h2>
                        <div class="main-content">${post.summary!}</div>
                        <hr/>
                        <div class="meta">
                            <ul class="breadcrumb">
                                <li><@global.timeline datetime=post.createTime/></li>
                                <li><i class="fa fa-eye"></i>${post.visits?c}</li>
                                <#if !post.disallowComment!false><li><i class="fa fa-comments-o"></i>${post.commentCount?c}</li></#if>
                                <li><i class="fa fa-thumbs-o-up"></i>${post.likes?c}</li>
                                <#assign heat= (24+post.visits*0.1+post.likes*2+post.commentCount*3) />
                                <#assign heatColor= '#'+(heat < 37)?string('ffa87e',(heat < 120)?string('fb734a','e0081c')) />
                                <li style="color: ${heatColor}">${heat}℃</li>
                            </ul>
                            <#if post.categories?? && post.categories?size gt 0>
                                <div class="level-item is-hidden-mobile">
                                    <#list post.categories as category>
                                        <a href="${category.fullPath!}">${category.name!}</a>&nbsp;
                                    </#list>
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>
            <#elseif thumbnail != '' && (thumbnail_mode == "small-right" || (thumbnail_mode == "small-alter" && post_index%2 == 1))>
                <div class="card-small">
                    <div class="card-content main">
                        <h2 class="title">
                            <#if post.topPriority==1><span class="top">置顶</span></#if><a
                                    href="${post.fullPath!}">${post.title!}</a>
                        </h2>
                        <div class="main-content">${post.summary!}</div>
                        <hr/>
                        <div class="meta">
                            <ul class="breadcrumb">
                                <li><@global.timeline datetime=post.createTime/></li>
                                <li><i class="fa fa-eye"></i>${post.visits?c}</li>
                                <#if !post.disallowComment!false><li><i class="fa fa-comments-o"></i>${post.commentCount?c}</li></#if>
                                <li><i class="fa fa-thumbs-o-up"></i>${post.likes?c}</li>
                                <#assign heat= (24+post.visits*0.1+post.likes*2+post.commentCount*3) />
                                <#assign heatColor= '#'+(heat < 37)?string('ffa87e',(heat < 120)?string('fb734a','e0081c')) />
                                <li style="color: ${heatColor}">${heat}℃</li>
                            </ul>
                            <#if post.categories?? && post.categories?size gt 0>
                                <div class="level-item is-hidden-mobile">
                                    <#list post.categories as category>
                                        <a href="${category.fullPath!}">${category.name!}</a>&nbsp;
                                    </#list>
                                </div>
                            </#if>
                        </div>
                    </div>
                    <a href="${post.fullPath!}"><div class="small-image" style="background-image: url(${thumbnail!})"></div></a>
                </div>
            <#elseif post.topPriority==1 && thumbnail_mode == "fold">
                <h2 class="title">
                    <span class="top">置顶</span><a href="${post.fullPath!}">${post.title!}</a>
                </h2>
                <ul class="breadcrumb">
                    <li><@global.timeline datetime=post.createTime/></li>
                    <li><i class="fa fa-eye"></i>${post.visits?c}</li>
                </ul>
            <#else>
                <#if thumbnail?? && thumbnail!=''>
                    <a class="thumbnail" href="${post.fullPath!}">
                        <div class="thumbnail-image" style="background-image: url(${thumbnail!})">
                        </div>
                    </a>
                </#if>
                <div class="card-content main">
                    <h2 class="title">
                        <#if post.topPriority==1><span class="top">置顶</span></#if><a
                                href="${post.fullPath!}">${post.title!}</a>
                    </h2>
                    <div class="meta">
                        <ul class="breadcrumb">
                            <li><@global.timeline datetime=post.createTime/></li>
                            <li><i class="fa fa-eye"></i>${post.visits?c}</li>
                            <#if !post.disallowComment!false><li class="is-hidden-mobile"><i class="fa fa-comments-o"></i>${post.commentCount?c}</li></#if>
                            <li class="is-hidden-mobile"><i class="fa fa-thumbs-o-up"></i>${post.likes?c}</li>
                            <#assign heat= (24+post.visits*0.1+post.likes*2+post.commentCount*3) />
                            <#assign heatColor= '#'+(heat < 37)?string('ffa87e',(heat < 120)?string('fb734a','e0081c')) />
                            <li style="color: ${heatColor}">${heat}℃</li>
                        </ul>
                        <#if post.categories?? && post.categories?size gt 0>
                            <div class="level-item">
                                <#list post.categories as category>
                                    <a href="${category.fullPath!}">${category.name!}</a>&nbsp;
                                </#list>
                            </div>
                        </#if>
                    </div>
                    <hr/>
                    <div class="main-content">${post.summary!}</div>
                </div>
            </#if>
        </div>
    </#list>
</#macro>