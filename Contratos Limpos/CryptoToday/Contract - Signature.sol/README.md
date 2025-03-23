# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Signature`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
|----------|-----------------------------------------|---------------|

---

### Análise por LLM

#### GPT-4o
| ID  | Descrição                                                    | Severidade Detectada | Correta? | Tipo (VP/FP/FN)               |
|-----|--------------------------------------------------------------|----------------------|----------|------------------------------|
| -   | Falta de Controle de Acesso                                  | High                 | ❌       | FP                           |
| -   | Uso de ecrecover sem Verificação Rigorosa de s e v            | High                 | ❌       | FP                           |
| -   | Assinatura Não Inclui o Endereço do Contrato                  | Medium               | ❌       | FP                           |
| -   | Uso de abi.encodePacked Pode Levar a Colisões de Hash        | Low                  | ❌       | FP                           |
| -   | Possível Falta de Controle sobre Nonces                      | Undetermined         | ❌       | FP                           |
| -   | Licença WTFPL                                                | Informational        | ❌       | FP                           |
| -   | Comentários Desatualizados                                    | Informational        | ❌       | FP                           |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Description                                                    | Detected Severity      | Correct?  | Type (VP/FP/FN) |
|-----|--------------------------------------------------------------|------------------------|-----------|-----------------|
| -   | Hash Collision via Packed Encoding                           | High                   | ❌        | FP              |
| -   | Replay Attacks Due to Unhandled Nonces                       | High                   | ❌        | FP              |
| -   | Signature Replay in verifyNFT Function                       | High                   | ❌        | FP              |
| -   | Inadequate v Parameter Validation                            | Medium                 | ❌        | FP              |
| -   | Signature Malleability Risk                                  | Medium                 | ❌        | FP              |
| -   | Missing Signer Address Validation                            | Low                    | ❌        | FP              |
| -   | Dead Code Presence                                            | Informational          | ❌        | FP              |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Llama 3.3
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo |
|--------------|--------------------------|--------------------------|----------|------|
| -          | Uso de função `ecrecover` sem proteção contra re.play | High severity | ❌ | FP |
| -          | Falta de validação de parâmetros | High severity | ❌ | FP |
| -          | Uso de `assembly` | Medium severity | ❌ | FP |
| -          | Falta de eventos | Medium severity | ❌ | FP |
| -          | Funções não utilizadas | Low severity | ❌ | FP |
| -          | Nomeação de funções | Low severity | ❌ | FP |
| -          | Uso de `keccak256` | Undetermined severity | ❌ | FP |
| -          | Lidar com assinaturas inválidas | Undetermined severity | ❌ | FP |
| -          | Falta de documentação | Informational severity | ❌ | FP |
| -          | Uso de versão antiga do Solidity | Informational severity | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID | Descrição                | Severidade Detectada     | Correta? | Tipo |
|--------------|--------------------------|--------------------------|----------|------|
| -          | Uso de Assembly para Manipulação de Assinatura | Medium severity | ❌ | FP |
| -          | Falta de Proteção Contra Replay no Contrato | Medium severity | ❌ | FP |
| -          | Número Mágico no Tamanho da Assinatura | Informational severity | ❌ | FP |
| -          | Retorno Implícito em Assembly | Informational severity | ❌ | FP |
| -          | Dependência da Segurança no Signatário Externo | Informational severity | ❌ | FP |
| -          | Comentário Desatualizado ou Confuso sobre Funções Não Utilizadas | Informational severity | ❌ | FP |
| -          | Licença WTFPL (Do What The F*** You Want to Public License) | Informational severity | ❌ | FP |
| -          | Suscetibilidade à Maleabilidade de Assinatura (inherente ao ECDSA) | Informational severity | ❌ | FP |

**Matriz de Confusão**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 8 (FP)                 |
| **Não Detectado** | 0 (FN)         | 0 (VN)                 |

---


## Métricas Agregadas (Signature.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 9.38 |
| **DeepSeek-R1** | 51.32 |
| **Llama 3.3** | 27.59 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 13.34 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 7 | 0 | 0 |
| **DeepSeek-R1** | 0 | 7 | 0 | 0 |
| **Llama 3.3** | 0 | 10 | 0 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 8 | 0 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

