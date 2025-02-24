﻿<cfoutput>
<div class="row">

    <div class="col-md-8" id="main-content-slot">

    	<div class="panel panel-default">

			<div class="panel-heading">

				<!--- Top Actions --->
				<div class="float-right mt10">
					<!--- Back To Inbox --->
					#announce( "cbadmin_onAuthorEditorActions" )#

					<!--- Export But --->
					<cfif prc.oCurrentAuthor.hasPermission( "AUTHOR_ADMIN,TOOLS_EXPORT" )>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-sms btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-sliders-h"></i> Actions
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li>
									<a href="#event.buildLink( prc.xehExport )#/authorID/#prc.author.getAuthorID()#.json" target="_blank">
										<i class="fa fa-file-export fa-lg"></i> Export
									</a>
								</li>
								<li>
									<a href="#event.buildLink( prc.xehPasswordReset )#/authorID/#prc.author.getAuthorID()#/editing/true"
										title="Issue a password reset for the user upon next login.">
										<i class="fa fa-key"></i> Reset Password
									</a>
								</li>
							</ul>
						</div>
					</cfif>
				</div>

				<div class="size16 p10 row">

					<span>
						<a
							title="Back"
							class="btn btn-sm btn-back mt5"
							<cfif prc.oCurrentAuthor.hasPermission( "AUTHOR_ADMIN" )>
								href="#event.buildLink( prc.xehAuthors )#">
							<cfelse>
								href="#event.buildLink( prc.xehDashboard )#">
							</cfif>
							<i class="fa fa-chevron-left fa-2x"></i>
						</a>
					</span>

					<span>
						#getInstance( "Avatar@contentbox" ).renderAvatar(
							email = prc.author.getEmail(),
							size  = "30",
							class = "img img-circle mr5 ml5"
						)#
					</span>

					<span>
						#prc.author.getFullName()#
					</span>
				</div>
            </div>

            <div class="panel-body">

            	<!--- Messageboxes --->
            	#cbMessageBox().renderit()#

            	<!--- Vertical Nav --->
                <div class="tab-wrapper tab-left tab-primary">

                    <!--- Documentation Navigation Bar --->
                    <ul class="nav nav-tabs">

                    	<li class="active">
							<a href="##details" data-toggle="tab">
								<i class="fa fa-eye fa-lg"></i> Details
							</a>
                    	</li>
						<li>
							<a href="##change-password" data-toggle="tab">
								<i class="fa fa-key fa-lg"></i> Password
							</a>
						</li>
						<li>
							<a href="##twofactor"  data-toggle="tab">
								<i class="fa fa-mobile-alt fa-lg fa-lg"></i> Two Factor
							</a>
						</li>
						<li>
							<a href="##preferences" data-toggle="tab">
								<i class="fa fa-briefcase fa-lg"></i> Preferences</a>
						</li>
						<li>
							<a href="##permissions" onclick="loadPermissions();" data-toggle="tab">
								<i class="fa fa-user-shield fa-lg"></i> Permissions
							</a>
						</li>
						<cfif prc.oCurrentAuthor.hasPermission( "ENTRIES_ADMIN,ENTRIES_EDITOR,PAGES_ADMIN,PAGES_EDITOR,CONTENTSTORE_ADMIN,CONTENTSTORE_EDITOR" )>
						<li>
							<a href="##latestEdits" data-toggle="tab">
								<i class="fa fa-history fa-lg"></i> Latest Edits
							</a>
						</li>
						<li>
							<a href="##latestDrafts" data-toggle="tab">
								<i class="fa fa-pencil-ruler fa-lg"></i> Latest Drafts
							</a>
						</li>
						</cfif>

						<!--- cbadmin Event --->
    					#announce( "cbadmin_onAuthorEditorNav" )#
                    </ul>

                    <!--- Tab Content --->
                    <div class="tab-content">
                    	<!--- Author Details --->
                    	#view( view="authors/editor/details", prePostExempt=true )#

						<!--- Change Password --->
						#view( view="authors/editor/password", prePostExempt=true )#

						<!--- Two Factor--->
                    	#view( view="authors/editor/twoFactor", prePostExempt=true )#

						<!--- Preferences --->
						#view( view="authors/editor/preferences", prePostExempt=true )#

						<!--- Permissions --->
						#view( view="authors/editor/permissions", prePostExempt=true )#

						<cfif prc.oCurrentAuthor.hasPermission( "ENTRIES_ADMIN,ENTRIES_EDITOR,PAGES_ADMIN,PAGES_EDITOR,CONTENTSTORE_ADMIN,CONTENTSTORE_EDITOR" )>
							<!--- Latest Edits --->
							#view( view="authors/editor/edits", prePostExempt=true )#

							<!--- Latest Drafts --->
							#view( view="authors/editor/drafts", prePostExempt=true )#
						</cfif>

						<!--- cbadmin Event --->
						#announce( "cbadmin_onAuthorEditorContent" )#
                   	</div>
                   	<!--- End Tab Content--->
                </div>
            </div>
 		</div>
    </div>

    <!--- ****************************************************************************** --->
    <!--- SIDEBAR --->
    <!--- ****************************************************************************** --->

    #view( view="authors/editor/sidebar", prePostExempt=true )#
</div>
</cfoutput>
