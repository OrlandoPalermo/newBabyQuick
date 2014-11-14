<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="ServiceMail.aspx.cs" Inherits="newBabyQuick.ServiceMail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="indexP" runat="server">
    <script runat="server">
       
    </script>

    <div class="container" style="position: relative; top: 15px;">
        <div class="panel panel-default">
            <div class="panel-heading text-center"><h3>Service mail</h3>
                <div class="btn-group">
                      <label class="btn btn-default">
                         <input type="radio" name="typeMail" id="btnInbox" />Réception <span class="glyphicon glyphicon-inbox"></span>
                      </label>
                      <label class="btn btn-default">
                         <input type="radio" name="typeMail" id="btnWrite"/>Ecrire <span class="glyphicon glyphicon-pencil"></span>
                     </label>
                </div>
            </div>

            <div class="panel-body" id="read">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <h4>Sujets 
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:Label runat="server" ID="badge" CssClass="badge"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>    
                                </h4>
                            </div>
                            <div class="col-lg-12">
                               
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                         <asp:Timer runat="server" Id="timerList" OnTick="timerList_Tick" Interval="4000"></asp:Timer>
                                        <asp:BulletedList runat="server" ID="ListMail" CssClass="list-unstyled" OnClick="ListMail_Click" DisplayMode="LinkButton"></asp:BulletedList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="timerList" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                  
                            </div>
                      
                        </div>
                    
                    </div>
                    <div class="col-lg-9">
                        <div class="row">
                            
                            <div class="col-lg-12 text-center"><h4>Affichage</h4></div>
                            <div class="col-lg-12">

                                
                                  <div class="row">
                                      <asp:Updatepanel runat="server">
                                          <Triggers>
                                              <asp:AsyncPostBackTrigger ControlID="ListMail" EventName="Click" />
                                          </Triggers>
                                          <ContentTemplate>
                                              <asp:TextBox runat="server" ID="Id" Visible="false"></asp:TextBox>
                                              <div class="col-lg-12"><h5 style="display: inline-block;">Sujet : </h5><asp:Label runat="server" ID="Subject" /><div class="pull-right"><asp:Button runat="server" CssClass="btn btn-danger" Text="Supprimer" ID="deleteMail" OnClick="deleteMail_Click"/></div></div>
                                                   <label class="col-lg-12"><h5 style="display: inline-block;">De : </h5><asp:Label runat="server" ID="From" /></label>
                                                   <div class="col-lg-12">
                                                           <h5>Contenu : </h5>
                                                           <asp:TextBox runat="server" ID="Contenu" TextMode="MultiLine" Height="200" Width="500"></asp:TextBox>
                                               </div>
                                          </ContentTemplate>
                                      
                                          </asp:Updatepanel>
                                  </div>
                            </div>
                      
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="hide text-center" id="write">
                    <div>
                        <label for="indexP_sujetW">Sujet :</label><asp:TextBox runat="server" ID="sujetW" CssClass="form-control" style="margin: auto;"></asp:TextBox>
                    </div>
                    <div>
                        <label for="indexP_destW">Destinataire :</label><asp:TextBox runat="server" ID="destW" CssClass="form-control" style="margin: auto;"></asp:TextBox>
                    </div>
                    <div>
                         <label for="indexP_contenuW">Contenu : </label><asp:TextBox runat="server" TextMode="MultiLine" ID="contenuW" CssClass="form-control" style="margin: auto;"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="sendMail" CssClass="btn btn-success" Text="Envoyer" OnClick="sendMail_Click" style="margin: auto;"/>
                    </div>          
                </div>
                <div class="col-lg-5"></div>
            </div>
            </div>
            
        </div>

    <script>
        $(function () {
            $("#btnInbox").click(function () {
                $("#read").addClass("show").removeClass("hide");
                $("#write").addClass("hide").removeClass("show");
            });
            $("#btnWrite").click(function () {
                $("#read").addClass("hide").removeClass("show");
                $("#write").addClass("show").removeClass("hide");
            });
        });
    </script>
</asp:Content>
