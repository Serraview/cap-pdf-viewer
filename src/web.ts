import { WebPlugin } from '@capacitor/core';

import type { PdfViewerPlugin } from './definitions';

export class PdfViewerWeb extends WebPlugin implements PdfViewerPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  present(options: { url: string }): void {
    console.warn('This feature is not implemented for web', options);
  }
}
