export interface PdfViewerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;

  present(options: { url: string }): void;

}
