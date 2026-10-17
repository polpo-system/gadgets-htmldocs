MODULE HTMLDocsTest;  (** HTMLDocsTest.Run: a small page parsed as an HTML document; needs the desktop's display *)

IMPORT Files, Texts, Objects, Display, Gadgets, Documents, Modules, TextDocs, TextStreams, HyperDocs, HTMLDocs, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Line(VAR R: Files.Rider; s: ARRAY OF CHAR);
VAR i: LONGINT;
BEGIN
  i := 0; WHILE s[i] # 0X DO Files.Write(R, s[i]); INC(i) END;
  Files.Write(R, 0AX)
END Line;

PROCEDURE Run*;
VAR f: Files.File; R: Files.Rider; obj: Objects.Object; doc: Documents.Document; T: Texts.Text; key: LONGINT;
BEGIN
  fails := 0; checks := 0;
  f := Files.New("zq_test.html"); Files.Set(R, f, 0);
  Line(R, "<html><head><title>polpo</title></head>");
  Line(R, "<body><h1>Hello</h1><p>A paragraph with <b>bold</b> and <i>italic</i> words.</p></body></html>");
  Files.Register(f);
  obj := Gadgets.CreateObject("HTMLDocs.NewDoc");
  IF (obj # NIL) & (obj IS Documents.Document) THEN
    doc := obj(Documents.Document); doc.name := "zq_test.html";
    (* as the Load of HTMLDocs, but parsing at once (Load parses in a task of the desktop) *)
    key := HyperDocs.BuildKey(NIL, doc.name); NEW(T); Texts.Open(T, "zq_test.html");
    TextDocs.InitDoc(doc); HTMLDocs.Parse(doc, key, TextStreams.OpenReader(T, 0), TRUE, FALSE, TRUE);
    Check("zq_test.html parsed", (doc.dsc # NIL) & (doc.dsc IS Display.Frame))
  ELSE Check("HTMLDocs.NewDoc", FALSE)
  END;
  Check("HTMLDocs loaded for the page", Modules.FindMod("HTMLDocs") # NIL);
  Out.String("HTMLDocsTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END HTMLDocsTest.
