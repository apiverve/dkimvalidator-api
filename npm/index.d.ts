declare module '@apiverve/dkimvalidator' {
  export interface dkimvalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface dkimvalidatorResponse {
    status: string;
    error: string | null;
    data: DKIMValidatorData;
    code?: number;
  }


  interface DKIMValidatorData {
      dkimHost:         string;
      dkimRecord:       string;
      dkimRecordsCount: number;
      hasDKIMRecord:    boolean;
      host:             string;
      issuesFound:      IssuesFound[];
      keyType:          string;
      selector:         string;
      valid:            boolean;
      version:          string;
  }
  
  interface IssuesFound {
      code:    string;
      message: string;
      type:    string;
  }

  export default class dkimvalidatorWrapper {
    constructor(options: dkimvalidatorOptions);

    execute(callback: (error: any, data: dkimvalidatorResponse | null) => void): Promise<dkimvalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dkimvalidatorResponse | null) => void): Promise<dkimvalidatorResponse>;
    execute(query?: Record<string, any>): Promise<dkimvalidatorResponse>;
  }
}
