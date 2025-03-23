# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Liquidator`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID   | Descrição                                                                          | Severidade       |
|------|----------------------------------------------------------------------------------|------------------|
| VEN-1 | O protocolo pode obter mais colateral do que o desejado                         | Low              |
| VEN-2 | Falta de validação de entrada                                                  | Low              |
| VEN-3 | Uso de versão vulnerável do Solidity                                           | Low              |
| VEN-4 | A lógica de redução de reserva pode não ser executada                          | Low              |
| VEN-5 | `forceVAILiquidate` não inicializado permite contornar a validação da dívida VAI | Low              |
| VEN-6 | A liquidação pausada do token VAI pode ser contornada                          | Informational    |
| VEN-7 | A propriedade pode ser renunciada                                             | Informational    |

#### GPT-4o 

| ID    | Descrição                                                                 | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)              |
|-------|---------------------------------------------------------------------------|---------------------------|----------|------------------------------|
| VEN-1 | O protocolo pode obter mais colateral do que o desejado                   | -                       | ❌       | FN                           |
| VEN-2 | Falta de validação de entrada                                             | -                    | ❌       | FN     |
| VEN-3 | Uso de versão vulnerável do Solidity                                      | -                         | ❌       | FN                        |
| VEN-4 | A lógica de redução de reserva pode não ser executada                     | -                         | ❌       | FN                         |
| VEN-5 | `forceVAILiquidate` não inicializado permite contornar a validação da dívida VAI | -                    | ❌       | FN                  |
| VEN-6 | A liquidação pausada do token VAI pode ser contornada                     | -                         | ❌       | FN                         |
| VEN-7 | A propriedade pode ser renunciada                                         | -                         | ❌       | FN                         |
| -     | Uso de Variáveis `immutable` em um Contrato Upgradável                    | High                      | ❌       | FP                           |
| -     | Possível Ataque de Reentrância                                            | High                      | ❌       | FP                           |
| -     | Restrição de Liquidação Pode ser Manipulada                               | High                      | ❌       | FP                           |
| -     | Falta de Verificação de Endereço Zero em Algumas Funções                 | Medium                    | ❌       | FP                           |
| -     | Dependência Externa Não Validada                                          | Medium                    | ❌       | FP                           |
| -     | Erro de Parâmetro Duplicado                                               | Medium                    | ❌       | FP                           |
| -     | Falta de Eventos para Algumas Funções Administrativas                     | Low                       | ❌       | FP                           |
| -     | Possível Problema com `msg.value` em `liquidateBorrow()`                  | Low                       | ❌       | FP                           |
| -     | Possível Falta de Validação do `treasuryPercentMantissa_`                 | Undetermined               | ❌       | FP                          |
| -     | Comentários e Documentação Incompletos                                    | Informational             | ❌       | FP                           |
| -     | Uso de `reinitializer(2)` sem Explicação                                  | Informational             | ❌       | FP                           |

### **Matriz de Confusão:**  
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|------------------|------------------------|
| **Detectado** | 0 (VP)           | 1 (FP)                 |
| **Não Detectado** | 7 (FN)       | 0 (VN)                 |

### **Não Houve Erro de Classificação** 

#### DeepSeek-R.1

**Tabela LLM:**

| ID     | Descrição                                                | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)                  |
|--------|----------------------------------------------------------------|--------------------------|----------|----------------------------------|
| VEN-1 | O protocolo pode obter mais colateral do que o desejado                   | -                       | ❌       | FN                           |
| VEN-2  | Falta de validação de entrada                                | -                      |  ❌      | FN                               |
| VEN-3 | Uso de versão vulnerável do Solidity                                      | -                         | ❌       | FN                        |
| VEN-4  | A lógica de redução de reserva pode não ser executada          | Low                      | ✅       | VP                               |
| VEN-5  | `forceVAILiquidate` não inicializado permite contornar a validação da dívida VAI | Informational | ❌       | FN   (Severidade incorreta) |
| VEN-6  | A liquidação pausada do token VAI pode ser contornada          | -            | ❌       | FN                               |
| VEN-7 | A propriedade pode ser renunciada                                         | -                         | ❌       | FN                         |
| -      | Unsafe Token Approval Handling                                 | High                     | ❌       | FP                               |
| -      | Potential Front-Running Initialization                         | High                     | ❌       | FP                               |
| -      | Incorrect Handling of BEP20 Transfer Fees                      | Medium                   | ❌       | FP                               |
| -      | Dependent on External Contract State                           | Medium                   | ❌       | FP                               |
| -      | Pending Redeem Array Manipulation                              | Medium                   | ❌       | FP                               |
| -      | Rounding Errors in Fund Distribution                           | Low                      | ❌       | FP                               |
| -      | Lack of Reentrancy Guards in Ancillary Functions               | Low                      | ❌       | FP                               |
| -      | Insufficient Validation in Protocol Share Reserve Update       | Informational            | ❌       | FP                               |
| -      | Event Emission After State Changes                             | Informational            | ❌       | FP                               |

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 9 (FP)                |
| **Não Detectado** | 6 (FN)         | 0 (VN)                 |

**Erro de Classificação**

| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| VEN-5             | Informational          | Low                    | **1**    |  

#### Llama 3.3

| ID   | Descrição                                                                          | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|------|----------------------------------------------------------------------------------|--------------------------|----------|----------------|
| VEN-1 | O protocolo pode obter mais colateral do que o desejado                         | -                      | ❌       | FN            |
| VEN-2 | Falta de validação de entrada                                                  | -                      | ❌       | FN            |
| VEN-3 | Uso de versão vulnerável do Solidity                                           | -                      | ❌       | FN            |
| VEN-4 | A lógica de redução de reserva pode não ser executada                          | -                      | ❌       | FN            |
| VEN-5 | `forceVAILiquidate` não inicializado permite contornar a validação da dívida VAI | -                      | ❌       | FN            |
| VEN-6 | A liquidação pausada do token VAI pode ser contornada                          | -            | ❌       | FN            |
| VEN-7 | A propriedade pode ser renunciada                                             | -            | ❌       | FN            |
| -    | Reentrancy na função `liquidateBorrow`                                      | High                     | ❌       | FP            |
| -    | Ataque Econômico na função `transfer`                                      | High                     | ❌       | FP            |
| -    | Permissões Excessivas na função `restrictLiquidation` e `unrestrictLiquidation` | Medium                   | ❌       | FP            |
| -    | Utilização de funções obsoletas                                      | Medium                   | ❌       | FP            |
| -    | Falta de verificação de estado na `_checkForceVAILiquidate`                    | Medium                   | ❌       | FP            |
| -    | Uso de tipos de dados inseguros (`uint256`)                                    | Low                      | ❌       | FP            |
| -    | Falta de documentação                                                        | Low                      | ❌       | FP            |
| -    | Utilização de funções não verificadas (`requireNoError`)                   | Low                      | ❌       | FP            |
| -    | Interoperabilidade com outros contratos                                        | Undetermined              | ❌       | FP            |
| -    | Dependência de bibliotecas externas (`openzeppelin/contracts-upgradeable`)    | Undetermined              | ❌       | FP            |
| -    | Falta de testes                                                               | Informational            | ❌       | FP            |
| -    | Falta de auditoria                                                           | Informational            | ❌       | FP            |

### **Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 12 (FP)                |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

### **Não Houve Erro de Classificação**

#### Gemini 2.0 Flash Thinking Experimental 01-21

**Tabela LLM:**

| ID   | Descrição                                             | Severidade Detectada | Correta? | Tipo (VP/FP/FN)                |
|------|-------------------------------------------------------|----------------------|----------|--------------------------------|
| VEN-1 | O protocolo pode obter mais colateral do que o desejado | -                  | ❌       | FN                             |
| VEN-2 | Falta de validação de entrada                         | -                  | ❌       | FN                             |
| VEN-3 | Uso de versão vulnerável do Solidity                  | -                  | ❌       | FN                             |
| VEN-4 | A lógica de redução de reserva pode não ser executada | -                  | ❌       | FN                             |
| VEN-5 | `forceVAILiquidate` não inicializado permite contornar a validação da dívida VAI | - | ❌       | FN                             |
| VEN-6 | A liquidação pausada do token VAI pode ser contornada | -        | ❌       | FN                             |
| VEN-7 | A propriedade pode ser renunciada                     | -        | ❌       | FN                             |
| -    | Potencial Negação de Serviço (DoS) na Redução de Reservas devido ao grande array `pendingRedeem` | Medium         | ❌       | FP     |
| -    | Risco de Crescimento Descontrolado do Array `pendingRedeem` | Medium               | ❌       | FP                             |
| -    | Potenciais Problemas de Limite de Gas no Loop de Processamento `_reduceReservesInternal` | Medium      | ❌       | FP                |
| -    | Risco de Configuração Incorreta de Controle de Acesso | Medium               | ❌       | FP                             |
| -    | Possibilidade de Reentrância em Chamadas Externas durante a Redução de Reservas | Low                  | ❌       | FP                |
| -    | Dependência de Oráculo e Risco de Manipulação        | Informational        | ❌       | FP                             |
| -    | Risco de Front-running na Execução de Liquidação     | Informational        | ❌       | FP                             |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

## Métricas Agregadas (Liquidator.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 14.89 |
| **DeepSeek-R1** | 61.20 |
| **Llama 3.3** | 20.08 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 17.16 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 1 | 7 | 0 |
| **DeepSeek-R1** | 1 | 9 | 6 | 0 |
| **Llama 3.3** | 0 | 12 | 7 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 7 | 7 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 1 | 1 | 1.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

