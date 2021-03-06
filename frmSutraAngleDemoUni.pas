unit frmSutraAngleDemoUni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GLScene, GLObjects, {GLMisc,} GLWin32Viewer, StdCtrls, Spin,
  ExtCtrls, {AsyncTimer,} GLGeomObjects, GLGui, GLWindows, GLAVIRecorder,
  ArgusDataEntry, JvExControls, JvComponent, JvSpeedButton, OpenGL1x,
  GLCoordinates, GLCrossPlatform, GLBaseClasses, GLAsyncTimer, GLExtrusion;

type
  TfrmSutraAngleDemo = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLSphere1: TGLSphere;
    GLLightSource1: TGLLightSource;
    Panel1: TPanel;
    seAngle1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    seAngle2: TSpinEdit;
    Label3: TLabel;
    seAngle3: TSpinEdit;
    AsyncTimer1: TGLAsyncTimer;
    btnAnimate: TButton;
    GLArrowLine1: TGLArrowLine;
    GLArrowLine2: TGLArrowLine;
    GLArrowLine3: TGLArrowLine;
    GLDummyCube1: TGLDummyCube;
    Label4: TLabel;
    adeX: TArgusDataEntry;
    Label5: TLabel;
    Label6: TLabel;
    adeY: TArgusDataEntry;
    Label7: TLabel;
    adeZ: TArgusDataEntry;
    arSutraAngle: TGLAVIRecorder;
    sbtnRecord: TJvSpeedButton;
    glcylndrAxis1: TGLCylinder;
    glcylndrAxis2: TGLCylinder;
    glcylndrAxis3: TGLCylinder;
    glRotationSolidCurvedArrow1: TGLRevolutionSolid;
    glConeArrowhead1: TGLCone;
    glRotationSolidCurvedArrow2: TGLRevolutionSolid;
    glConeArrowhead2: TGLCone;
    glRotationSolidCurvedArrow3: TGLRevolutionSolid;
    glConeArrowhead3: TGLCone;
    glrvltnsldPartialSphere1: TGLRevolutionSolid;
    glrvltnsldPartialSphere2: TGLRevolutionSolid;
    glrvltnsldPartialSphere3: TGLRevolutionSolid;
    glrvltnsldPartialSphere4: TGLRevolutionSolid;
    glrvltnsldPartialSphere5: TGLRevolutionSolid;
    glrvltnsldPartialSphere6: TGLRevolutionSolid;
    glrvltnsldPartialSphere7: TGLRevolutionSolid;
    glrvltnsldPartialSphere8: TGLRevolutionSolid;
    glLightSource2: TGLLightSource;
    procedure seAngle1Change(Sender: TObject);
    procedure btnAnimateClick(Sender: TObject);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure adeXChange(Sender: TObject);
    procedure adeYChange(Sender: TObject);
    procedure adeZChange(Sender: TObject);
    procedure sbtnRecordClick(Sender: TObject);
  private
    FAngle3: integer;
    FAngle1: integer;
    FAngle2: integer;
    procedure SetAngle1(const Value: integer);
    procedure SetAngle2(const Value: integer);
    procedure SetAngle3(const Value: integer);
    procedure Restore;
    procedure RestoreUpAndDirection;
  private
    property Angle1: integer read FAngle1 write SetAngle1;
    property Angle2: integer read FAngle2 write SetAngle2;
    property Angle3: integer read FAngle3 write SetAngle3;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSutraAngleDemo: TfrmSutraAngleDemo;

implementation

uses GLVectorGeometry;

{$R *.dfm}

const
  DummyCubeStartAngle = 0;

procedure TfrmSutraAngleDemo.Restore;
begin
  Angle1 := 0;
  Angle2 := 0;
  Angle3 := 0;
  RestoreUpAndDirection;
end;

procedure TfrmSutraAngleDemo.RestoreUpAndDirection;
var
  Up: TAffineVector;
  Direction: TAffineVector;
begin
  Up.V[0] := -0.1736481;
  Up.V[1] := 0.9848077;
  Up.V[2] := 0;
  Direction.V[0] := 0;
  Direction.V[1] := 0;
  Direction.V[2] := 1;
  GLDummyCube1.Up.AsAffineVector := Up;
  GLDummyCube1.Direction.AsAffineVector := Direction;
end;

procedure TfrmSutraAngleDemo.seAngle1Change(Sender: TObject);
begin
  Restore;
  Angle1 := seAngle1.Value;
  Angle2 := seAngle2.Value;
  Angle3 := seAngle3.Value;

  if Sender = seAngle1 then
  begin
    glRotationSolidCurvedArrow1.Visible := True;
    glRotationSolidCurvedArrow2.Visible := False;
    glRotationSolidCurvedArrow3.Visible := False;
  end
  else if Sender = seAngle2 then
  begin
    glRotationSolidCurvedArrow1.Visible := False;
    glRotationSolidCurvedArrow2.Visible := True;
    glRotationSolidCurvedArrow3.Visible := False;
  end
  else
  begin
    glRotationSolidCurvedArrow1.Visible := False;
    glRotationSolidCurvedArrow2.Visible := False;
    glRotationSolidCurvedArrow3.Visible := True;
  end;

end;

procedure TfrmSutraAngleDemo.btnAnimateClick(Sender: TObject);
begin
  glRotationSolidCurvedArrow1.Visible := False;
  glRotationSolidCurvedArrow2.Visible := False;
  glRotationSolidCurvedArrow3.Visible := False;
  Restore;
  AsyncTimer1.Enabled := True;
end;

procedure TfrmSutraAngleDemo.AsyncTimer1Timer(Sender: TObject);
begin
  if Angle1 <> seAngle1.Value then
  begin
    glRotationSolidCurvedArrow1.Visible := True;
    glRotationSolidCurvedArrow2.Visible := False;
    glRotationSolidCurvedArrow3.Visible := False;
    if seAngle1.Value > Angle1 then
    begin
      Angle1 := Angle1 + 1;
    end
    else
    begin
      Angle1 := Angle1 - 1;
    end;
  end
  else if Angle2 <> seAngle2.Value then
  begin
    glRotationSolidCurvedArrow1.Visible := False;
    glRotationSolidCurvedArrow2.Visible := True;
    glRotationSolidCurvedArrow3.Visible := False;
    if seAngle2.Value > Angle2 then
    begin
      Angle2 := Angle2 + 1;
    end
    else
    begin
      Angle2 := Angle2 - 1;
    end;
  end
  else if Angle3 <> seAngle3.Value then
  begin
    glRotationSolidCurvedArrow1.Visible := False;
    glRotationSolidCurvedArrow2.Visible := False;
    glRotationSolidCurvedArrow3.Visible := True;
    if seAngle3.Value > Angle3 then
    begin
      Angle3 := Angle3 + 1;
    end
    else
    begin
      Angle3 := Angle3 - 1;
    end;
  end
  else
  begin
    glRotationSolidCurvedArrow1.Visible := False;
    glRotationSolidCurvedArrow2.Visible := False;
    glRotationSolidCurvedArrow3.Visible := False;
    AsyncTimer1.Enabled := False;
  end;

  if arSutraAngle.Recording then
  begin
    arSutraAngle.AddAVIFrame;
  end;

  if not AsyncTimer1.Enabled and arSutraAngle.Recording then
  begin
    arSutraAngle.CloseAVIFile;
    sbtnRecord.Down := False;
  end;
end;

procedure TfrmSutraAngleDemo.SetAngle1(const Value: integer);
begin
  FAngle1 := Value;
  GLDummyCube1.RollAngle := -FAngle1 + DummyCubeStartAngle;
end;

procedure TfrmSutraAngleDemo.SetAngle2(const Value: integer);
begin
  FAngle2 := Value;
  GLDummyCube1.TurnAngle := -FAngle2;
end;

procedure TfrmSutraAngleDemo.SetAngle3(const Value: integer);
begin
  FAngle3 := Value;
  GLDummyCube1.PitchAngle := -FAngle3;
end;

procedure TfrmSutraAngleDemo.adeXChange(Sender: TObject);
begin
  if GLSphere1 = nil then Exit;
  try
    GLSphere1.Scale.X := StrToFloat(adeX.Text);
  except on EConvertError do
    begin
    end;
  end;
end;

procedure TfrmSutraAngleDemo.adeYChange(Sender: TObject);
begin
  if GLSphere1 = nil then Exit;
  try
    GLSphere1.Scale.Y := StrToFloat(adeY.Text);
  except on EConvertError do
    begin
    end;
  end;
end;

procedure TfrmSutraAngleDemo.adeZChange(Sender: TObject);
begin
  if GLSphere1 = nil then Exit;
  try
    GLSphere1.Scale.Z := StrToFloat(adeZ.Text);
  except on EConvertError do
    begin
    end;
  end;
end;

procedure TfrmSutraAngleDemo.sbtnRecordClick(Sender: TObject);
var
  CreateSuceeded: boolean;
begin
  if sbtnRecord.Down then
  begin
    arSutraAngle.Filename := '';
    arSutraAngle.Height := GLSceneViewer1.Height;
    arSutraAngle.Width := GLSceneViewer1.Width;
    try
      CreateSuceeded := arSutraAngle.CreateAVIFile;
    except on E: Exception do
      begin
        CreateSuceeded := False;
        MessageDlg('Unable to create file.  Error message = "'
          + E.Message + '"', mtWarning, [mbOK], 0);
      end;
    end;
    if CreateSuceeded then
    begin
      btnAnimateClick(Sender);
    end
    else
    begin
      sbtnRecord.Down := false;
    end;
  end
  else
  begin
    if arSutraAngle.Recording then
    begin
      arSutraAngle.CloseAVIFile(True);
    end;
  end;
end;

initialization

   Set8087CW($133F);
   
end.
