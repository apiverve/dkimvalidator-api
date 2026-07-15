declare module '@apiverve/dkimvalidator' {
  export interface dkimvalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface dkimvalidatorResponse {
    status: string;
    error: string | null;
    data: DKIMValidatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface DKIMValidatorData {
      selector:         null | string;
      host:             null | string;
      dkimHost:         null | string;
      cnameTarget:      null;
      hasDKIMRecord:    boolean | null;
      dkimRecord:       null | string;
      dkimRecordsCount: number | null;
      version:          null | string;
      keyType:          null | string;
      keyBits:          number | null;
      isTestMode:       boolean | null;
      issuesFound:      IssuesFound[];
      valid:            boolean | null;
      riskScore:        number | null;
      riskLevel:        null | string;
  }
  
  interface IssuesFound {
      code:    null | string;
      type:    null | string;
      message: null | string;
  }

  export default class dkimvalidatorWrapper {
    constructor(options: dkimvalidatorOptions);

    execute(callback: (error: any, data: dkimvalidatorResponse | null) => void): Promise<dkimvalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dkimvalidatorResponse | null) => void): Promise<dkimvalidatorResponse>;
    execute(query?: Record<string, any>): Promise<dkimvalidatorResponse>;
  }
}
